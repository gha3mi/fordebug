character(*),     intent(in), optional :: message    !! Message to print
character(*),     intent(in), optional :: file_name  !! File to write to
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