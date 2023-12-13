module fordebug

   use iso_fortran_env, only: int32, int64, real32, real64
   use fortime, only: timer, timer_start, timer_stop

   implicit none

   private

   public pwrite, timer, ptimer_start, ptimer_stop

   interface
      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure module subroutine pwrite(&
         message, format, file, &
         R0i32, R0r32, R0c32, R0i64, R0r64, R0c64, R0ch, &
         R1i32, R1r32, R1c32, R1i64, R1r64, R1c64, &
         R2i32, R2r32, R2c32, R2i64, R2r64, R2c64, &
         access)
         include 'pwrite.inc'
      end subroutine pwrite
      !===============================================================================


      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure module subroutine ptimer_start(t)
         type(timer), intent(out) :: t
      end subroutine ptimer_start
      !===============================================================================


      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure module subroutine ptimer_stop(t, message)
         type(timer), intent(out) :: t
         character(len=*), intent(in), optional :: message
      end subroutine ptimer_stop
      !===============================================================================
   end interface

end module fordebug
