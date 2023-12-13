submodule(fordebug) fordebug_smod

   implicit none

   interface
      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure subroutine impure_write(&
         message, format, file, &
         R0i32, R0r32, R0c32, R0i64, R0r64, R0c64, R0ch, &
         R1i32, R1r32, R1c32, R1i64, R1r64, R1c64, &
         R2i32, R2r32, R2c32, R2i64, R2r64, R2c64, &
         access)
         import int32, int64, real32, real64
         include 'pwrite.inc'
      end subroutine impure_write
      !===============================================================================


      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure subroutine impure_timer_start(t)
         import timer
         type(timer), intent(out) :: t
      end subroutine impure_timer_start
      !===============================================================================


      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure subroutine impure_timer_stop(t, message)
         import timer
         type(timer), intent(out) :: t
         character(len=*), intent(in), optional :: message
      end subroutine impure_timer_stop
      !===============================================================================
   end interface


contains


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   module procedure pwrite
      call impure_write(&
         message, format, file, &
         R0i32, R0r32, R0c32, R0i64, R0r64, R0c64, R0ch, &
         R1i32, R1r32, R1c32, R1i64, R1r64, R1c64, &
         R2i32, R2r32, R2c32, R2i64, R2r64, R2c64, &
         access)
   end procedure pwrite
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   module procedure ptimer_start
      call impure_timer_start(t)
   end procedure ptimer_start
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   module procedure ptimer_stop
      call impure_timer_stop(t, message)
   end procedure ptimer_stop
   !===============================================================================

end submodule fordebug_smod





!===============================================================================
!> author: Seyed Ali Ghasemi
subroutine impure_write(&
   message, format, file, &
   R0i32, R0r32, R0c32, R0i64, R0r64, R0c64, R0ch, &
   R1i32, R1r32, R1c32, R1i64, R1r64, R1c64, &
   R2i32, R2r32, R2c32, R2i64, R2r64, R2c64, &
   access)
   use iso_fortran_env, only: int32, int64, real32, real64
   implicit none
   include 'pwrite.inc'
   integer :: nunit !! Unit number

   ! Open the file if it was specified
   if (present(file)) then
      if (present(access)) then
         open(newunit=nunit, file=trim(file), access=access, action='write')
      else
         open(newunit=nunit, file=trim(file), action='write')
      end if
   end if

   !===================================================
   ! Write optional rank 0 variables
   !===================================================

   ! Write optional rank 0 character variables
   if (present(R0ch)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R0ch
            else
               write(nunit, *) message, R0ch
            end if
         else
            if (present(format)) then
               write(nunit, format) R0ch
            else
               write(nunit, *) R0ch
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R0ch
            else
               write(*, *) message, R0ch
            end if
         else
            if (present(format)) then
               write(*, format) R0ch
            else
               write(*, *) R0ch
            end if
         end if
      end if
   end if

   ! Write optional rank 0 integer variables
   if (present(R0i32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R0i32
            else
               write(nunit, *) message, R0i32
            end if
         else
            if (present(format)) then
               write(nunit, format) R0i32
            else
               write(nunit, *) R0i32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R0i32
            else
               write(*, *) message, R0i32
            end if
         else
            if (present(format)) then
               write(*, format) R0i32
            else
               write(*, *) R0i32
            end if
         end if
      end if
   end if

   ! Write optional rank 0 integer variables
   if (present(R0i64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R0i64
            else
               write(nunit, *) message, R0i64
            end if
         else
            if (present(format)) then
               write(nunit, format) R0i64
            else
               write(nunit, *) R0i64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R0i64
            else
               write(*, *) message, R0i64
            end if
         else
            if (present(format)) then
               write(*, format) R0i64
            else
               write(*, *) R0i64
            end if
         end if
      end if
   end if

   ! Write optional rank 0 real variables
   if (present(R0r32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R0r32
            else
               write(nunit, *) message, R0r32
            end if
         else
            if (present(format)) then
               write(nunit, format) R0r32
            else
               write(nunit, *) R0r32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R0r32
            else
               write(*, *) message, R0r32
            end if
         else
            if (present(format)) then
               write(*, format) R0r32
            else
               write(*, *) R0r32
            end if
         end if
      end if
   end if

   ! Write optional rank 0 real variables
   if (present(R0r64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R0r64
            else
               write(nunit, *) message, R0r64
            end if
         else
            if (present(format)) then
               write(nunit, format) R0r64
            else
               write(nunit, *) R0r64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R0r64
            else
               write(*, *) message, R0r64
            end if
         else
            if (present(format)) then
               write(*, format) R0r64
            else
               write(*, *) R0r64
            end if
         end if
      end if
   end if

   ! Write optional rank 0 complex variables
   if (present(R0c32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R0c32
            else
               write(nunit, *) message, R0c32
            end if
         else
            if (present(format)) then
               write(nunit, format) R0c32
            else
               write(nunit, *) R0c32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R0c32
            else
               write(*, *) message, R0c32
            end if
         else
            if (present(format)) then
               write(*, format) R0c32
            else
               write(*, *) R0c32
            end if
         end if
      end if
   end if

   ! Write optional rank 0 complex variables
   if (present(R0c64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R0c64
            else
               write(nunit, *) message, R0c64
            end if
         else
            if (present(format)) then
               write(nunit, format) R0c64
            else
               write(nunit, *) R0c64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R0c64
            else
               write(*, *) message, R0c64
            end if
         else
            if (present(format)) then
               write(*, format) R0c64
            else
               write(*, *) R0c64
            end if
         end if
      end if
   end if

   !===================================================
   ! Write optional rank 1 arrays
   !===================================================

   ! Write optional rank 1 integer arrays
   if (present(R1i32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R1i32
            else
               write(nunit, *) message, R1i32
            end if
         else
            if (present(format)) then
               write(nunit, format) R1i32
            else
               write(nunit, *) R1i32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R1i32
            else
               write(*, *) message, R1i32
            end if
         else
            if (present(format)) then
               write(*, format) R1i32
            else
               write(*, *) R1i32
            end if
         end if
      end if
   end if

   ! Write optional rank 1 integer arrays
   if (present(R1i64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R1i64
            else
               write(nunit, *) message, R1i64
            end if
         else
            if (present(format)) then
               write(nunit, format) R1i64
            else
               write(nunit, *) R1i64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R1i64
            else
               write(*, *) message, R1i64
            end if
         else
            if (present(format)) then
               write(*, format) R1i64
            else
               write(*, *) R1i64
            end if
         end if
      end if
   end if

   ! Write optional rank 1 real arrays
   if (present(R1r32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R1r32
            else
               write(nunit, *) message, R1r32
            end if
         else
            if (present(format)) then
               write(nunit, format) R1r32
            else
               write(nunit, *) R1r32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R1r32
            else
               write(*, *) message, R1r32
            end if
         else
            if (present(format)) then
               write(*, format) R1r32
            else
               write(*, *) R1r32
            end if
         end if
      end if
   end if

   ! Write optional rank 1 real arrays
   if (present(R1r64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R1r64
            else
               write(nunit, *) message, R1r64
            end if
         else
            if (present(format)) then
               write(nunit, format) R1r64
            else
               write(nunit, *) R1r64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R1r64
            else
               write(*, *) message, R1r64
            end if
         else
            if (present(format)) then
               write(*, format) R1r64
            else
               write(*, *) R1r64
            end if
         end if
      end if
   end if

   ! Write optional rank 1 complex arrays
   if (present(R1c32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R1c32
            else
               write(nunit, *) message, R1c32
            end if
         else
            if (present(format)) then
               write(nunit, format) R1c32
            else
               write(nunit, *) R1c32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R1c32
            else
               write(*, *) message, R1c32
            end if
         else
            if (present(format)) then
               write(*, format) R1c32
            else
               write(*, *) R1c32
            end if
         end if
      end if
   end if

   ! Write optional rank 1 complex arrays
   if (present(R1c64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R1c64
            else
               write(nunit, *) message, R1c64
            end if
         else
            if (present(format)) then
               write(nunit, format) R1c64
            else
               write(nunit, *) R1c64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R1c64
            else
               write(*, *) message, R1c64
            end if
         else
            if (present(format)) then
               write(*, format) R1c64
            else
               write(*, *) R1c64
            end if
         end if
      end if
   end if

   !===================================================
   ! Write optional rank 2 arrays
   !===================================================

   ! Write optional rank 2 integer arrays
   if (present(R2i32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R2i32
            else
               write(nunit, *) message, R2i32
            end if
         else
            if (present(format)) then
               write(nunit, format) R2i32
            else
               write(nunit, *) R2i32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R2i32
            else
               write(*, *) message, R2i32
            end if
         else
            if (present(format)) then
               write(*, format) R2i32
            else
               write(*, *) R2i32
            end if
         end if
      end if
   end if

   ! Write optional rank 2 integer arrays
   if (present(R2i64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R2i64
            else
               write(nunit, *) message, R2i64
            end if
         else
            if (present(format)) then
               write(nunit, format) R2i64
            else
               write(nunit, *) R2i64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R2i64
            else
               write(*, *) message, R2i64
            end if
         else
            if (present(format)) then
               write(*, format) R2i64
            else
               write(*, *) R2i64
            end if
         end if
      end if
   end if

   ! Write optional rank 2 real arrays
   if (present(R2r32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R2r32
            else
               write(nunit, *) message, R2r32
            end if
         else
            if (present(format)) then
               write(nunit, format) R2r32
            else
               write(nunit, *) R2r32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R2r32
            else
               write(*, *) message, R2r32
            end if
         else
            if (present(format)) then
               write(*, format) R2r32
            else
               write(*, *) R2r32
            end if
         end if
      end if
   end if

   ! Write optional rank 2 real arrays
   if (present(R2r64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R2r64
            else
               write(nunit, *) message, R2r64
            end if
         else
            if (present(format)) then
               write(nunit, format) R2r64
            else
               write(nunit, *) R2r64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R2r64
            else
               write(*, *) message, R2r64
            end if
         else
            if (present(format)) then
               write(*, format) R2r64
            else
               write(*, *) R2r64
            end if
         end if
      end if
   end if

   ! Write optional rank 2 complex arrays
   if (present(R2c32)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R2c32
            else
               write(nunit, *) message, R2c32
            end if
         else
            if (present(format)) then
               write(nunit, format) R2c32
            else
               write(nunit, *) R2c32
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R2c32
            else
               write(*, *) message, R2c32
            end if
         else
            if (present(format)) then
               write(*, format) R2c32
            else
               write(*, *) R2c32
            end if
         end if
      end if
   end if

   ! Write optional rank 2 complex arrays
   if (present(R2c64)) then
      if (present(file)) then
         if (present(message)) then
            if (present(format)) then
               write(nunit, format) message, R2c64
            else
               write(nunit, *) message, R2c64
            end if
         else
            if (present(format)) then
               write(nunit, format) R2c64
            else
               write(nunit, *) R2c64
            end if
         end if
      else
         if (present(message)) then
            if (present(format)) then
               write(*, format) message, R2c64
            else
               write(*, *) message, R2c64
            end if
         else
            if (present(format)) then
               write(*, format) R2c64
            else
               write(*, *) R2c64
            end if
         end if
      end if
   end if

   ! Close the file if it was opened
   if (present(file)) close(nunit)

end subroutine impure_write
!===============================================================================


!===============================================================================
!> author: Seyed Ali Ghasemi
subroutine impure_timer_start(t)
   use fortime
   implicit none
   type(timer), intent(out) :: t

   call timer_start(t)
end subroutine impure_timer_start
!===============================================================================


!===============================================================================
!> author: Seyed Ali Ghasemi
subroutine impure_timer_stop(t, message)
   use fortime
   implicit none
   type(timer), intent(out) :: t
   character(*), intent(in), optional :: message

   call timer_stop(t, message=message)
end subroutine impure_timer_stop
!===============================================================================
