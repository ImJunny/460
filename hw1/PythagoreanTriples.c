// Author:     John Nguyen
// E-mail:     jnn5163@psu.edu
// Course:     CMPSC 460
// Assignment: Fortran / C Programming Project
// Due date:   2/7/2025
// File:       PythagoreanTriples.c
// Purpose:    This program prompts a user to enter 3 positive integers and 
//             reports whether or not they form a Pythagorean Triple. If they
//             do, the area of the corresponding right triangle is also computed
//             and displayed. The program loops until the user decides that s/he
//             is done testing integers.
// IDE/Compiler:     https://www.onlinegdb.com/online_c_compiler
// Operating system: Windows 10
// References:       N/A

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

// function used by getThreeIntegers to validate single integer, updates single integer
void validateInteger(int* num){
  scanf("%d", num);
  while (*num <= 0) {
    printf("**ERROR: Integer must be positive. Please re-enter.**\n");
    scanf("%d", num);
  }
}

// function to get three integers, using variables as reference
void getThreeIntegers(int* a, int* b, int* c){
  printf("First integer: ");
  validateInteger(a);
  printf("Second integer: ");
  validateInteger(b);
  printf("Third integer: ");
  validateInteger(c);
}

// function get validate triple, returns boolean value
bool validateTriple(int a, int b, int c){
  if ((a*a + b*b == c*c) || (a*a + c*c == b*b) || (b*b + c*c == a*a)) return true;
  return false;
}

// function to calculate area, returns area
int getArea(int a, int b, int c){
    int first, second;
    if (a*a + b*b == c*c){
        first = a;
        second = b;
    }else if (a*a + c*c == b*b){
        first = a;
        second = c;
    }else{
        first = b;
        second = c;
    }
    return first*second/2;
}

// function to print separator used for readability in output/terminal
void printSeparator(){
    printf("\n**********************************************\n");
}

// main function
int main() {
  char choice;
  printSeparator();
  printf( "The purpose of this program is to determine if 3 positive "
          "integers entered by a user form a Pythagorean Triple. "
          "If they do, the area of the corresponding right triangle "
          "is also computed and displayed.");
    printSeparator();
  while(true){
    printf("Please enter 3 positive integers when prompted!\n");
    int x, y, z;
    getThreeIntegers(&x, &y, &z);
    printf("Integers entered: %d, %d, %d\n", x, y, z);
    bool isTriple = validateTriple(x, y, z);
    if (isTriple){
      printf("The integers ARE a Pythagorean Triple.\n");
      float area = getArea(x, y, z);
      printf("The area of the right triangle they form is %f.\n", area);
    }else{
      printf("The integers are NOT a Pythagorean Triple.\n");
    }
    
    printSeparator();
    
    printf("Do you want to test more integers?\n");
    printf("Type Y or y to run again, any other character to quit.\n");
    printf("Your choice? ");
    scanf(" %c", &choice);
    if (choice!='Y' && choice!='y') exit(0);
    printSeparator();
  }
  return 0;
}