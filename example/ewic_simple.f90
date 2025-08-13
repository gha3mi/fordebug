program simple
   use fordebug, only: debug, debug_loc
   implicit none

   type(debug) :: err

   print*, " "
   print*, "Running simple example..."

   ! Info: starting a numerical solve
   call err%set(&
      severity   = 3, &
      code       = 10, &
      category   = "initialization", &
      message    = "Starting Cholesky factorization", &
      location   = debug_loc(__FILE__, 9), &
      suggestion = "Proceed; this is a standard setup step." )
   call err%print()

   ! Warning: potential numerical issue
   call err%set(&
      severity   = 2, &
      code       = 20, &
      category   = "numerical-warning", &
      message    = "Matrix is not positive definite", &
      location   = "simple.f90:18", &
      suggestion = "Check matrix symmetry and eigenvalues before factorization." )
   call err%print()

   ! Error: hard failure
   call err%set(&
      severity   = 1, &
      code       = 30, &
      category   = "arithmetic-error", &
      message    = "Division by zero detected in pivot step", &
      location   = "simple.f90:27", &
      suggestion = "Ensure pivot elements are nonzero; consider partial pivoting." )
   call err%print()

   call err%reset()
end program simple
