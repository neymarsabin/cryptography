#include<stdio.h>


int main ()
{
  int a, b , n, i ;
  int A=1;

  printf("enter the value of a b and n \n");
  scanf("%d%d%d",&a,&b,&n);
  //  printf("%d\n %d \n %d \n ",a,b,n);    
  for (i = 0; i < b; ++i) {

    A=(A*a)%n;
    
  
  }
  printf("%d\n",A);
  return 0;

}





