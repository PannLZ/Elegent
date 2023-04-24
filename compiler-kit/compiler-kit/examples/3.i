# 1 "3.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "3.c"
typedef union Person
{
 unsigned long long id;

 struct
 {
  int age;
  char firstname[4];
 };

 char nickname[8];
} Person;

# 1 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 1 3 4
# 25 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
# 1 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/features.h" 1 3 4
# 197 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/features.h" 3 4
# 1 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/bits/uClibc_config.h" 1 3 4
# 198 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/features.h" 2 3 4
# 395 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/features.h" 3 4
# 1 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/sys/cdefs.h" 1 3 4
# 396 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/features.h" 2 3 4
# 26 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 2 3 4






# 1 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/lib/gcc/i686-buildroot-linux-uclibc/9.4.0/include/stddef.h" 1 3 4
# 209 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/lib/gcc/i686-buildroot-linux-uclibc/9.4.0/include/stddef.h" 3 4

# 209 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/lib/gcc/i686-buildroot-linux-uclibc/9.4.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 33 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 2 3 4




extern void *memcpy (void *__restrict __dest,
       const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

# 81 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 130 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 165 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4


extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

# 181 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 212 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 246 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 275 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern int __xpg_strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))

                        __attribute__ ((__nonnull__ (2)));
# 313 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 346 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 369 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));






extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 393 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 423 "/home/ubuntu/wuming2.0/i686-buildroot-linux-uclibc_sdk-buildroot/i686-buildroot-linux-uclibc/sysroot/usr/include/string.h" 3 4
extern size_t strlcat(char *__restrict dst, const char *__restrict src,
                      size_t n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strlcpy(char *__restrict dst, const char *__restrict src,
                      size_t n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



# 15 "3.c" 2


# 16 "3.c"
int main()
{
 Person ps;
 ps.age = 40;
 strcpy(ps.firstname, "tom");

 return 0;
}
