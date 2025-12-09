#include <stdio.h>

int main()
{
    int count = 0;
    char ch;
    printf("Enter input to count newlines (press Ctrl+D to end):\n");
    while ((ch = getchar()) != EOF)
    {
        if (ch == '\n')
        {
            count++;
        }
    }
    printf("Number of newlines: %d\n", count);
    return 0;
}
