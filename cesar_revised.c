#include<string.h>
#include<math.h>
#include<ctype.h>
#include<stdio.h>

int decrypt();
int encrypt();

int main()
{
  encrypt();
  decrypt();
}

int encrypt()
{
char plaintext[100];
int key;
printf ("\n what is the plain text? or cipher text");
fgets(plaintext,100,stdin);
printf("\n what is the key?");
scanf("%d",&key);
int result;
int length = strlen(plaintext);

if (key >= 26 )
{
    key = key % 26;
}

for(int i=0;i<length;i++)
        {
        result = (plaintext[i]+key);

        if (isupper(plaintext[i]) && (result > 'Z'))
        {
            result = (result - 26);
        }

    if (islower(plaintext[i]) && (result > 'z'))
        {
            result = (result - 26);
        }

                if (isalpha(plaintext[i]))
        {
            printf("%c", result);
        }

         else
        {
            printf("%c", plaintext[i]);
        }

         }
                    printf("\n");
                    return 0;
		    
}


int decrypt()
{
char ptext[100];
int k;
printf ("\n what is the plain text? or cipher text \n");
fgets(ptext,100,stdin);
printf("\n what is the key?");
scanf("%d",&k);
int result;
int length = strlen(ptext);

if (k >= 26 )
{
    k = k % 26;
}

for(int i=0;i<length;i++)
{
        result = (ptext[i] - k + 26);

        if (isupper(ptext[i]) && (result > 'Z'))
        {
            result = (result - 26);
        }

    if (islower(ptext[i]) && (result > 'z'))
        {
            result = (result - 26 );
        }

                if (isalpha(ptext[i]))
        {
            printf("%c", result);
        }

         else
        {
            printf("%c", ptext[i]);
        }
}
printf("\n");
return 0;
}
