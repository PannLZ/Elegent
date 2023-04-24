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

#include <string.h>

int main()
{
	Person ps;
	ps.age = 40;
	strcpy(ps.firstname, "tom");

	return 0;
}
