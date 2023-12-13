program demo
   use iso_fortran_env, only: rk => real64
   implicit none

   real(rk), dimension(:), allocatable :: y

   call pure_subroutine(10.0_rk, 7, y)

contains

   pure subroutine pure_subroutine(x, n, y)

      use fordebug
      implicit none

      real(rk), intent(in)               :: x
      integer,  intent(in)               :: n
      real(rk), intent(out), allocatable :: y(:)
      integer                            :: i
      type(timer)                        :: t

      ! Print Rank 0 real64 with a message and format. message and format are optional
      call pwrite(message='x = ', R0r64=x, format='(a,f7.3)')

      ! Write Rank 0 real64 with a message and format to a file. message and format are optional
      call pwrite(message='x = ', R0r64=x, format='(a,f7.3)', file='example/demo.txt', access='append')

      ! Print Rank 0 int32 with a message and format. message and format are optional
      call pwrite(message='n = ', R0i32=n, format='(a,i3)')

      ! Write Rank 0 int32 with a message and format to a file. message and format are optional
      call pwrite(message='n = ', R0i32=n, format='(a,i3)', file='example/demo.txt', access='append')
      
      ! Print Rank 0 character with a format. format is optional
      call pwrite(R0ch='start loop', format='(a)')

      ! Write Rank 0 character with a format to a file. format, access are optional
      call pwrite(R0ch='start loop', format='(a)', file='example/demo.txt', access='append')

      allocate(y(n))
      y(1) = 0.0_rk

      ! start pure timer
      call ptimer_start(t)

      do concurrent (i=2:n)
         y(i) = y(i-1) + x

         ! Print Rank 0 real64 with a message and format. message and format are optional
         call pwrite(message='y(i) = ', R0r64=y(i), format='(a,f7.3)')

         ! Write Rank 0 real64 with a message and format to a file. message and format are optional
         call pwrite(message='y(i) = ', R0r64=y(i), format='(a,f7.3)', file='example/demo.txt', access='append')
      end do

      ! stop pure timer
      call ptimer_stop(t)

      ! Print Rank 0 real64 with a message and format. message and format are optional
      call pwrite(R0ch='end loop', format='(a)') ! format is optional

      ! Write Rank 0 real64 with a message and format to a file. message and format are optional
      call pwrite(R0ch='end loop', format='(a)', file='example/demo.txt', access='append')

      ! Print Rank 0 real64 with a message and format. message and format are optional
      call pwrite(message='y = ',R1r64=y)

      ! Write Rank 0 real64 with a message and format to a file. message and format are optional
      call pwrite(message='y = ',R1r64=y, file='example/demo.txt', access='append')
   end subroutine pure_subroutine

end program demo
