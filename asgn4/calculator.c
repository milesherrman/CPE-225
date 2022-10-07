#include "operations.h"
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    char cont = 'y';
    int num1; 
    int num2; 
    int op;
    int result;
   
    printf("Welcome to the Calculator program.\n");
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7: xor 8:lshift 9:rshift\n");
   
    while (cont != 'n')
    {
        printf("\nEnter number: ");
        scanf(" %d", &num1);
        printf("Enter second number: ");
        scanf(" %d", &num2);
        printf("Select operation: ");
        scanf(" %d", &op);
        if (op < 1 || op > 9){ printf("Result: Invalid Operation\n");}
        else
        {  
            if (op == 1) { result = add(num1, num2);}
            else if (op == 2) { result = sub(num1, num2);}
            else if (op == 3) { result = mul(num1, num2);}
            else if (op == 4) { result = divi(num1, num2);}
            else if (op == 5) { result = and(num1, num2);}
            else if (op == 6) { result = or(num1, num2);}
            else if (op == 7) { result = xor(num1, num2);}
            else if (op == 8) { result = lshift(num1, num2);}
            else { result = rshift(num1, num2);}
            
            printf("Result: %d \n", result);    
        }
        
        printf("Continue (y/n)?: ");
        scanf(" %c", &cont);
    }

    printf("\nExiting\n\n");
    return 0;
}