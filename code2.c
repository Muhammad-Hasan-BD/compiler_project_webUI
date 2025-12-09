#include <stdio.h>
#include <ctype.h>

int main()
{
    char s[100];
    printf("Enter a string to check if it's a valid C identifier: ");
    scanf("%s", s);
    int i = 0;
    if (s[i] == '_' || isalpha(s[i]))
    {
        i++;
        while (s[i] != '\0')
        {
            if (s[i] == '_' || isalnum(s[i]))
            {
                i++;
            }
            else
            {
                printf("Not a valid C identifier\n");
                return 1;
            }
        }
        printf("Valid C identifier\n");
        return 0;
    }
    printf("Not a valid C identifier\n");
    return 1;
}
