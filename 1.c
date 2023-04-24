// This is the encapsulation of tcc and ld
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>

#define TCC_PATH "/mnt/compiler-kit/tcc"
#define LD_PATH "/mnt/compiler-kit/ld"
#define LIB_PATH "/mnt/compiler-kit/lib/"
#define INC_PATH "/mnt/compiler-kit/include/"

#define FREE_LIST_MAX_SZ 1024
char *free_list[FREE_LIST_MAX_SZ];
int free_list_end_ndx = 0;

__attribute__((destructor)) void free_all_in_list();

void put_to_free_list(char *buf)
{
    free_list[free_list_end_ndx++] = buf;

    if (free_list_end_ndx == FREE_LIST_MAX_SZ)
    {
        printf("internal error:free list full!\n");
        free_all_in_list();
        exit(1);
    }
}

__attribute__((destructor)) void free_all_in_list()
{
    for (int i = 0; i < free_list_end_ndx; i++)
    {
        free(free_list[i]);
        free_list[i] = NULL;
    }

    free_list_end_ndx = 0;
}

const char *get_true_name(const char *infile)
{
    int len = strlen(infile);

    for (int i = len - 1; i >= 0; i--)
    {
        if (infile[i] == '/')
        {
            return infile + i + 1;
        }
    }

    return infile;
}

char *estrcat(char **buf, int *buf_size, const char *src)
{
    // expand and strcat
    int cur_size = *buf_size;
    int leave_size = cur_size - strlen(*buf);

    if (leave_size < 0)
    {
        return 0x0;
    }

    while (strlen(src) + 1 > leave_size)
    {
        int new_size = cur_size * 2;

        char *buf1 = malloc(new_size);
        memset(buf1, 0, new_size);
        memcpy(buf1, *buf, cur_size);

        put_to_free_list(*buf);

        *buf = buf1;
        *buf_size = new_size;
        cur_size = new_size;
        leave_size = cur_size - strlen(*buf);
    }

    strcat(*buf, src);

    return *buf;
}

// never worry about memleak, free list handle it
char *get_lib_path(const char *name)
{
    char *buf = malloc(16);
    int buf_size = 16;

    estrcat(&buf, &buf_size, LIB_PATH);
    estrcat(&buf, &buf_size, name);

    put_to_free_list(buf);

    return buf;
}

// never worry about memleak, free list handle it
char *bindstr(const char *str1, const char *str2)
{
    char *buf = malloc(16);
    int buf_size = 16;
    estrcat(&buf, &buf_size, str1);
    estrcat(&buf, &buf_size, str2);

    put_to_free_list(buf);

    return buf;
}

void emit_error(const char *err)
{
    const char *error_suffix = "compile_error";
    puts(bindstr(err, error_suffix));
    exit(1);
}

void emit_warning(const char *warning)
{
    const char *success_suffix = "compile_success";

    if (!warning || strlen(warning) == 0)
    {
        warning = "compile success";
    }

    puts(bindstr(warning, success_suffix));
    exit(0);
}

int main(int argc0, char **argv0)
{
    if (argc0 != 2)
    {
        emit_error("invalid use");
    }

    pid_t pid = fork();

    if (pid < 0)
    {
        emit_error("fork failed");
    }

    if (pid == 0)
    {
        int tcc_out_fd = open("tcc_out", O_WRONLY | O_CREAT);

        if (dup2(tcc_out_fd, STDERR_FILENO) == -1 || close(tcc_out_fd) == -1)
        {
            emit_error("dup failed");
        }

        char *envp[2] = {NULL, NULL};
        char *argv[6];
        argv[0] = TCC_PATH;
        argv[1] = bindstr("-I", INC_PATH);
        argv[2] = "-c";
        argv[3] = "-g";
        argv[4] = argv0[1];
        argv[5] = NULL;

        if (0 > execve(TCC_PATH, argv, envp))
        {
            emit_error("execve failed");
        }
    }

    int status;
    waitpid(pid, &status, 0);

    int is_compile_success = (WIFEXITED(status) && WEXITSTATUS(status) == 0);

    FILE *fp_tcc_out = fopen("tcc_out", "r");
    char tcc_out_info[1024];
    memset(tcc_out_info, 0, 1024);
    fread(tcc_out_info, 1024, 1, fp_tcc_out);
    fclose(fp_tcc_out);

    char *objpath = bindstr(bindstr(getenv("PWD"), "/"), get_true_name(argv0[1]));
    objpath[strlen(objpath) - 1] = 'o';

    if (!is_compile_success)
    {
        remove(objpath);
        remove("tcc_out");
        emit_error(tcc_out_info);
    }

    pid = fork();

    if (pid < 0)
    {
        emit_error("fork failed");
    }

    if (pid == 0)
    {
        int ld_out_fd = open("ld_out", O_WRONLY | O_CREAT);

        if (dup2(ld_out_fd, STDERR_FILENO) == -1 || close(ld_out_fd) == -1)
        {
            emit_error("dup failed");
        }

        char *envp[2] = {NULL, NULL};
        char *argv[12];

        argv[0] = LD_PATH;
        argv[1] = "-m";
        argv[2] = "elf_i386";
        argv[3] = "-static";
        argv[4] = get_lib_path("crt1.o");
        argv[5] = get_lib_path("crti.o");
        argv[6] = get_lib_path("crtbegin.o");
        argv[7] = objpath;
        argv[8] = get_lib_path("libc.a");
        argv[9] = get_lib_path("crtend.o");
        argv[10] = get_lib_path("crtn.o");
        argv[11] = NULL;

        if (0 > execve(LD_PATH, argv, envp))
        {
            puts("internal error:execve failed!");
            return 1;
        }
    }

    waitpid(pid, &status, 0);
    int is_link_success = (WIFEXITED(status) && WEXITSTATUS(status) == 0);

    FILE *fp_ld_out = fopen("ld_out", "r");
    char ld_out_info[1024];
    memset(ld_out_info, 0, 1024);
    fread(ld_out_info, 1024, 1, fp_ld_out);
    fclose(fp_ld_out);

    if (!is_link_success)
    {
        remove(objpath);
        remove("ld_out");
        emit_error(ld_out_info);
    }

    remove(objpath);
    remove("ld_out");
    remove("tcc_out");
    emit_warning(tcc_out_info);
    return 0;
}
