! Author:     John Nguyen
! E-mail:     jnn5163@psu.edu
! Course:     CMPSC 460
! Assignment: Fortran / C Programming Project
! Due date:   2/7/2025
! File:       PythagoreanTriples.f90
! Purpose:    This program prompts a user to enter 3 positive integers and 
!             reports whether or not they form a Pythagorean Triple. If they
!             do, the area of the corresponding right triangle is also computed
!             and displayed. The program loops until the user decides that s/he
!             is done testing integers.
! IDE/Compiler:     https://www.onlinegdb.com/online_fortran_compiler
! Operating system: Windows 10
! References:       N/A



! main function that calls the subroutines
program main
  implicit none
  integer :: x, y, z
  logical :: isTriple = .false.
  CHARACTER :: choice
  real :: area

  call printSeparator()
  write(*, '(A)') "The purpose of this program is to determine if 3 positive "//&
                  "integers entered by a user form a Pythagorean Triple. "//&
                  "If they do, the area of the corresponding right triangle "//&
                  "is also computed and displayed."
  call printSeparator()

  do
    write(*, '(A)') "Please enter 3 positive integers when prompted."

    call getThreeintegers(x, y, z)
    write(*, '(A, I0, A, I0, A, I0)') "Integers entered: ", x, ", ", y, ", ", z
    
    call validateTriple(x, y, z, isTriple)
    if (isTriple .eqv. .true.) then
      write(*, '(A)') "The integers ARE a Pythagorean Triple."
      write(*, '(A)') "The integers ARE a Pythagorean Triple."
      call getArea(x, y, z, area)
      write(*,*) "The area of the right triangle they form is ", area, " square units."   
    else
      write(*, '(A)') "The integers are NOT a Pythagorean Triple."
    end if

    call printSeparator()

    write(*, '(A)') "Do you want to test more integers?"
    write(*, '(A)') "Type Y or y to run again, any other character to quit."
    write(*, '(A)', advance='NO') "Your choice? "
    read(*,*) choice
    if (choice .ne. 'Y' .and. choice .ne. 'y') then
      EXIT
    end if

    call printSeparator()
  end do

  contains
    ! subroutine to print separator for readability in output/terminal
    subroutine printSeparator()
      write(*, '(A)') "******************************************************"
    end subroutine printSeparator

    ! subroutine to obtain and validate the three integers entered by the user;
    ! 'returns' the integers using pass by reference.
    subroutine getThreeintegers(a, b, c)
      implicit none
      integer, intent(out) :: a, b, c
      write(*, '(A)', ADVANCE='NO') "First integer: "
      call getInteger(a)
      write(*, '(A)', ADVANCE='NO') "Second integer: "
      call getInteger(b)
      write(*, '(A)', ADVANCE='NO') "Third integer: "
      call getInteger(c)
    end subroutine getThreeintegers
  
    ! subroutine to obtain a single integer and validate it; 'returns' the integer
    ! using pass by reference; validates inputs to be positive integers
    subroutine getInteger(num)
      implicit none
      integer, intent(out) :: num
      read(*,*) num
      do while (num<=0)
        write(*, '(A)') "**ERROR: Integer must be positive. Please re-enter.**"
        read(*,*) num
      end do
    end subroutine getInteger

    ! subroutine to determine if passed integers make a Pythagorean Triple;
    ! 'returns' boolean of isTriple using pass by reference.
      subroutine validateTriple(a, b, c, isTriple)
        implicit none
        integer, intent(in) :: a, b, c
        logical, intent(out) :: isTriple
        if ((a**2 + b**2 == c**2) .or. (a**2 + c**2 == b**2) .or. (b**2 + c**2 == a**2)) then
          isTriple = .true.
        else
          isTriple = .false.
        end if
      end subroutine validateTriple  

    ! subroutine to calculate area of relevant integers in Pythagorean Triple;
    ! 'returns' value of area.
      subroutine getArea(a, b, c, area)
        implicit none
        integer, intent(in) :: a, b, c
        integer :: first, second
        real, intent(out) :: area
        if (a**2 + b**2 == c**2) then
          first = a
          second = b
        else if (a**2 + c**2 == b**2) then
          first = a
          second = c
        else
          first = b
          second = c
        end if

        area = first*second/2   
      end subroutine getArea
end program main  