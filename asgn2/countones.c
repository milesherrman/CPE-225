#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    char cont = 'y';
    int curr;
   
    printf("Welcome to the CountOnes program.\n");

    while (cont != 'n')
    {
        int i;
        int bts = 0;
        int user_num;
        int test_val = 1;

        printf("\nPlease enter a number: ");
        scanf(" %d", &user_num);
        
        for (i = 0; i < 32; i++)
        {
            curr = (user_num & test_val);
            if (curr != 0) bts++;
            test_val = test_val << 1;
        }
        printf("The number of bits set is: %d \n", bts);
        printf("Continue (y/n)?: ");
        scanf(" %c", &cont);
    }
    printf("Exiting\n\n");
    return 0;
}