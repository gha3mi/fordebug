module my_module
   use fordebug, only: debug, debug_loc
   implicit none
   private
   public my_type

   type my_type
      integer :: a, b
      type(debug) :: err
   contains
      procedure :: my_function
      procedure :: my_subroutine
   end type my_type

contains

   pure function my_function(this, a) result(b)
      class(my_type), intent(in) :: this
      integer, intent(in) :: a
      integer :: b

#if defined(FOR_DEBUG)
      if (.not. this%err%ok) then
         b = 0
         return
      end if
#endif

      b = 2 / a
   end function my_function

   pure subroutine my_subroutine(this, a)
      class(my_type), intent(inout) :: this
      integer, intent(in) :: a

#if defined(FOR_DEBUG)
      if (.not. this%err%ok) return
      if (a == 0) then
         call this%err%set(1, 100, "arithmetic/zero-division", "Division by zero, denominator a = 0", debug_loc(__FILE__, 26), "Enforce precondition a /= 0" )
         return
      end if
#endif

      this%b = this%my_function(a)
   end subroutine my_subroutine
end module my_module

program complex
   use my_module, only: my_type
   implicit none
   type(my_type) :: obj

   print*, " "
   print*, "Running complex example..."
   call obj%my_subroutine(0)
   call obj%err%print()
end program complex
