#include <stdio.h>
#include <string.h>

int main()
{
    char s[100];
    printf("Enter a string to check for regex ab*: ");
    scanf("%s", s);
    int i = 0;
    if (s[i] == 'a')
    {
        i++;
        while (s[i] == 'b')
        {
            i++;
        }
        if (s[i] == '\0')
        {
            printf("String matches the pattern ab*\n");
            return 0;
        }
    }
    printf("String does not match the pattern ab*\n");
    return 1;
}
