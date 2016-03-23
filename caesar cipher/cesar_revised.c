#include<string.h>
#include<math.h>
#include<ctype.h>
#include<stdio.h>
#include<fcntl.h>
int decrypt();
int encrypt();

int main()
{
  char c;
  printf("a) encrypt and b) decrypt \n");
  c=getchar();
  switch (c)
    {
  case 'a' :
    {
      fflush(stdin);
    encrypt();
    break;
    }
    case 'b' :
      {
      fflush(stdin);
	
      decrypt();
      break;
    }
    default:
      {
	printf(" goood \n");
    
      break;
  }
  return 0;

}
}

int encrypt()
{
char plaintext[100];
char key;
printf (" what is the plain text? or cipher text     ");
fgets(plaintext,100,stdin);
printf("\n what is the key? \n");
key=getchar();
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
char k;
int result;
printf ("\n what is the cipher text" );
fgets(ptext,100,stdin);
printf("\n what is the key?");
 k = getchar();

int length = strlen (ptext);

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
 fflush(stdin);
return 0;
}
