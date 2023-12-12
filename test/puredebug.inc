   !===============================================================================
   ! DEBUGGING
   !===============================================================================
   interface
   pure subroutine pwrite(&
      message, format, file_name, &
      R0i32, R0r32, R0c32, R0i64, R0r64, R0c64, R0ch, &
      R1i32, R1r32, R1c32, R1i64, R1r64, R1c64, &
      R2i32, R2r32, R2c32, R2i64, R2r64, R2c64, &
      access)
      !! author: Seyed Ali Ghasemi
      !! This subroutine is intended to be used for debugging purposes only.
      !! Prints information to the screen or a file.
      import int32, int64, real32, real64
   
      implicit none
   
      character(*), intent(in), optional :: message   !! Message to print
      character(*), intent(in), optional :: file_name !! File to write to
      character(*), intent(in), optional :: format    !! Format to use for printing
      
      character(*), intent(in), optional :: R0ch      !! Rank=0, character
      
      integer(int32),  intent(in), optional :: R0i32      !! Rank=0, integer, kind=int32
      integer(int64),  intent(in), optional :: R0i64      !! Rank=0, integer, kind=int64
      real(real32),     intent(in), optional :: R0r32      !! Rank=0, real   , kind=real32
      real(real64),     intent(in), optional :: R0r64      !! Rank=0, real   , kind=real64
      complex(real32),  intent(in), optional :: R0c32      !! Rank=0, complex, kind=real32
      complex(real64),  intent(in), optional :: R0c64      !! Rank=0, complex, kind=real64
   
      integer(int32),  intent(in), optional :: R1i32(:)   !! Rank=1, integer, kind=int32
      integer(int64),  intent(in), optional :: R1i64(:)   !! Rank=1, integer, kind=int64
      real(real32),     intent(in), optional :: R1r32(:)   !! Rank=1, real   , kind=real32
      real(real64),     intent(in), optional :: R1r64(:)   !! Rank=1, real   , kind=real64
      complex(real32),  intent(in), optional :: R1c32(:)   !! Rank=1, complex, kind=real32
      complex(real64),  intent(in), optional :: R1c64(:)   !! Rank=1, complex, kind=real64
   
      integer(int32),  intent(in), optional :: R2i32(:,:) !! Rank=2, integer, kind=int32
      integer(int64),  intent(in), optional :: R2i64(:,:) !! Rank=2, integer, kind=int64
      real(real32),     intent(in), optional :: R2r32(:,:) !! Rank=2, real   , kind=real32
      real(real64),     intent(in), optional :: R2r64(:,:) !! Rank=2, real   , kind=real64
      complex(real32),  intent(in), optional :: R2c32(:,:) !! Rank=2, complex, kind=real32
      complex(real64),  intent(in), optional :: R2c64(:,:) !! Rank=2, complex, kind=real64
   
      character(*), intent(in), optional :: access    !! Access mode for file
   end subroutine pwrite

   pure subroutine ptimer_start(t)
      import timer
      type(timer), intent(out) :: t
   end subroutine ptimer_start

   pure subroutine ptimer_stop(t, message)
      import timer
      type(timer), intent(out) :: t
      character(len=*), intent(in), optional :: message
   end subroutine ptimer_stop
end interface
!===============================================================================
!===============================================================================