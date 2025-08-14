module fordebug

   use iso_fortran_env, only: int32, int64, real32, real64
   use fortime, only: timer

   implicit none

   private

#if defined (NOPURE_DEBUG)
! No pure debug
public debug, debug_loc
#else
   public pwrite, timer, ptimer_start, ptimer_stop, debug, debug_loc
#endif

#if defined(FOR_DEBUG)
   logical, parameter, private :: DEBUG_MODE = .true.
#else
   logical, parameter, private :: DEBUG_MODE = .false.
#endif

   integer, parameter, private :: NONE    = 0
   integer, parameter, private :: ERROR   = 1
   integer, parameter, private :: WARNING = 2
   integer, parameter, private :: INFO    = 3

   integer, parameter, private :: MAX_LENGTH_CATEGORY   = 32
   integer, parameter, private :: MAX_LENGTH_MESSAGE    = 128
   integer, parameter, private :: MAX_LENGTH_LOCATION   = 128
   integer, parameter, private :: MAX_LENGTH_SUGGESTION = 128

   !===============================================================================
   type debug
      logical, private :: dbg = DEBUG_MODE                  !! debug mode flag
      logical :: ok = .true.                                  !! .true. means no error/warning/info
      integer, private :: code = NONE                         !! error/warning/info code, 0=none
      integer, private :: severity = NONE                     !! severity of the error, 0=none, 1=error, 2=warning, 3=info
      character(MAX_LENGTH_CATEGORY), private :: category     !! category of error/warning/info
      character(MAX_LENGTH_LOCATION), private :: location     !! location of error/warning/info
      character(MAX_LENGTH_MESSAGE), private :: message       !! message of error/warning/info
      character(MAX_LENGTH_SUGGESTION), private :: suggestion !! suggestion for error/warning/info
   contains
      procedure :: set
      procedure :: print => print_error
      procedure :: reset
   end type debug
   !===============================================================================

#if defined (NOPURE_DEBUG)
! No pure debug
#else
   interface
      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure module subroutine pwrite(&
         message, format, file, &
         R0i32, R0r32, R0c32, R0i64, R0r64, R0c64, R0ch, &
         R1i32, R1r32, R1c32, R1i64, R1r64, R1c64, &
         R2i32, R2r32, R2c32, R2i64, R2r64, R2c64, &
         access)
         implicit none
         character(*),     intent(in), optional :: message    !! Message to print
         character(*),     intent(in), optional :: file       !! File to write to
         character(*),     intent(in), optional :: format     !! Format to use for printing

         character(*),     intent(in), optional :: R0ch       !! Rank=0, character

         integer(int32),   intent(in), optional :: R0i32      !! Rank=0, integer, kind=int32
         integer(int64),   intent(in), optional :: R0i64      !! Rank=0, integer, kind=int64
         real(real32),     intent(in), optional :: R0r32      !! Rank=0, real   , kind=real32
         real(real64),     intent(in), optional :: R0r64      !! Rank=0, real   , kind=real64
         complex(real32),  intent(in), optional :: R0c32      !! Rank=0, complex, kind=real32
         complex(real64),  intent(in), optional :: R0c64      !! Rank=0, complex, kind=real64

         integer(int32),   intent(in), optional :: R1i32(:)   !! Rank=1, integer, kind=int32
         integer(int64),   intent(in), optional :: R1i64(:)   !! Rank=1, integer, kind=int64
         real(real32),     intent(in), optional :: R1r32(:)   !! Rank=1, real   , kind=real32
         real(real64),     intent(in), optional :: R1r64(:)   !! Rank=1, real   , kind=real64
         complex(real32),  intent(in), optional :: R1c32(:)   !! Rank=1, complex, kind=real32
         complex(real64),  intent(in), optional :: R1c64(:)   !! Rank=1, complex, kind=real64

         integer(int32),   intent(in), optional :: R2i32(:,:) !! Rank=2, integer, kind=int32
         integer(int64),   intent(in), optional :: R2i64(:,:) !! Rank=2, integer, kind=int64
         real(real32),     intent(in), optional :: R2r32(:,:) !! Rank=2, real   , kind=real32
         real(real64),     intent(in), optional :: R2r64(:,:) !! Rank=2, real   , kind=real64
         complex(real32),  intent(in), optional :: R2c32(:,:) !! Rank=2, complex, kind=real32
         complex(real64),  intent(in), optional :: R2c64(:,:) !! Rank=2, complex, kind=real64

         character(*),     intent(in), optional :: access     !! Access mode for file
      end subroutine pwrite
      !===============================================================================


      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure module subroutine ptimer_start(t)
         implicit none
         type(timer), intent(inout) :: t
      end subroutine ptimer_start
      !===============================================================================


      !===============================================================================
      !> author: Seyed Ali Ghasemi
      pure module subroutine ptimer_stop(t, message)
         implicit none
         type(timer), intent(inout) :: t
         character(len=*), intent(in), optional :: message
      end subroutine ptimer_stop
      !===============================================================================
   end interface
#endif

contains

   !===============================================================================
   !> author: Seyed Ali Ghasemi
   !> license: BSD 3-Clause
   pure elemental subroutine set(this, severity, code, category, message, location, suggestion)
      class(debug), intent(inout) :: this
      integer, intent(in) :: severity
      integer, intent(in) :: code
      character(len=*), intent(in) :: category
      character(len=*), intent(in) :: message
      character(len=*), intent(in) :: location
      character(len=*), intent(in) :: suggestion

      if (this%dbg) then
         if (severity/=NONE .and. severity/=ERROR .and. severity/= WARNING .and. severity/=INFO) error stop "Invalid severity level"
         this%severity = severity
         this%code     = code
         if (this%code /= NONE .or. this%severity /= NONE) this%ok = .false.
         this%category   = trim(category)
         this%message    = trim(message)
         this%suggestion = trim(suggestion)
         this%location   = trim(location)
      end if
   end subroutine set
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   !> license: BSD 3-Clause
   pure function debug_loc(file, line) result(s)
      character(*), intent(in) :: file
      integer,      intent(in) :: line
      character(len=256) :: s
      write(s,'(a,":",i0)') trim(file), line
   end function debug_loc
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   !> license: BSD 3-Clause
   impure subroutine print_error(this)
      class(debug), intent(in) :: this
      character(len=1) :: sev_letter
      character(len=*), parameter :: &
         ESC   = char(27), &
         RED   = ESC//"[31m", &
         YEL   = ESC//"[33m", &
         BLU   = ESC//"[34m", &
         GRY   = ESC//"[90m", &
         RST   = ESC//"[0m"
      character(len=5)  :: color
      character(len=20) :: code_str
      character(:), allocatable :: line

      if (this%dbg .and. .not. this%ok) then
         select case (this%severity)
          case (ERROR);   sev_letter = 'E'; color = RED
          case (WARNING); sev_letter = 'W'; color = YEL
          case (INFO);    sev_letter = 'I'; color = BLU
          case default;   sev_letter = 'N'; color = GRY
         end select

         write(code_str,'(i0)') this%code

         line = color//'['//sev_letter//trim(code_str)//']'//RST//' ' // &
            '('//GRY//trim(this%location)//RST//') ' // &
            trim(this%category)//': ' // &
            trim(this%message)

         if (len_trim(this%suggestion) > 0) then
            line = line//' ['//trim(this%suggestion)//']'
         end if

         write(*,'(a)') trim(line)
      end if
   end subroutine print_error
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   !> license: BSD 3-Clause
   pure elemental subroutine reset(this)
      class(debug), intent(inout) :: this

      this%dbg        = DEBUG_MODE
      this%ok         = .true.
      this%code       = NONE
      this%severity   = NONE
      this%category   = ""
      this%message    = ""
      this%location   = ""
      this%suggestion = ""
   end subroutine reset
   !===============================================================================

end module fordebug
