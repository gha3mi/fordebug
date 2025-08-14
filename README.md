[![GitHub](https://img.shields.io/badge/GitHub-ForDebug-blue.svg?style=social&logo=github)](https://github.com/gha3mi/fordebug)
[![Version](https://img.shields.io/github/release/gha3mi/fordebug.svg)](https://github.com/gha3mi/fordebug/releases/latest)
[![Documentation](https://img.shields.io/badge/ford-Documentation%20-blueviolet.svg)](https://gha3mi.github.io/fordebug/)
[![CI-CD](https://github.com/gha3mi/fordebug/actions/workflows/CI-CD.yml/badge.svg)](https://github.com/gha3mi/fordebug/actions/workflows/CI-CD.yml) 
[![License](https://img.shields.io/github/license/gha3mi/fordebug?color=green)](https://github.com/gha3mi/fordebug/blob/main/LICENSE)

**ForDebug**: A Fortran library designed for debugging Fortran code, especially within pure procedures.

## fpm dependency

If you want to use `ForDebug` as a dependency in your own fpm project,
you can easily include it by adding the following line to your `fpm.toml` file:

```toml
[dependencies]
fordebug = {git="https://github.com/gha3mi/fordebug.git"}
```

## Usage

### Error / Warning / Info Control

```Fortran
use fordebug, only: debug

type(debug) :: err

call err%set(&
  severity   = 1, &
  code       = 100, &
  category   = "math", &
  message    = "division by zero", &
  location   = my_module.f90:11, &
  suggestion = "Check denominator for zero." )

call err%print()

call err%reset()
```

#### Notes

- Define `FOR_DEBUG` preprocessor directive to enable error/warning/info control.

### Printing or Writing within Pure Procedures

To enable printing or writing within a pure procedure in Fortran, use the fordebug module.

```Fortran
use fordebug, only: pwrite

! within pure procedures
call pwrite(message='hello!')
call pwrite(R0i32=n)
call pwrite(message='x = ', R0r32=10.0, format='(a,f7.3)', file='example/demo.txt', access='append')
```

#### Notes

- All arguments of `pwrite` are optional.
- Data types are represented using the following conventions:
  - `R0i32`, `R0i64`, `R0r32`, `R0r64`, `R0c32`, `R0c64` for Rank 0 integer, real, and complex types.
  - `R1i32`, `R1i64`, `R1r32`, `R1r64`, `R1c32`, `R1c64` for Rank 1 integer, real, and complex types.
  - `R2i32`, `R2i64`, `R2r32`, `R2r64`, `R2c32`, `R2c64` for Rank 2 integer, real, and complex types.
  - `R0ch` for Rank 0 character.

### Measuring Elapsed Time within Pure Procedures

ForDebug uses [ForTmie](https://github.com/gha3mi/fortime) as dependency. For measuring elapsed time within a pure procedure, utilize the fordebug module with time derived type.

```Fortran
use fordebug, only: timer, ptimer_start, ptimer_stop

type(timer) :: t

call ptimer_start(t)
! Perform your operations here
call ptimer_stop(t) ! Output: Elapsed time:  0.000 [s]
```

## How to run examples

**Clone the repository:**

Clone the `ForDebug` repository from GitHub using the following command:

```shell
git clone https://github.com/gha3mi/fordebug.git
```

Navigate to the cloned directory:

```shell
cd fordebug
```

### Running examples

To run all examples, execute the following command:

```shell
fpm run --example --all --flag "-DFOR_DEBUG"
```

## Status

<!-- STATUS:setup-fortran-conda:START -->
| Compiler   | macos | ubuntu | windows |
|------------|----------------------|----------------------|----------------------|
| `flang-new` | - | fpm ❌  cmake ✅ | fpm ❌  cmake ❌ |
| `gfortran` | fpm ✅  cmake ✅ | fpm ✅  cmake ✅ | fpm ✅  cmake ✅ |
| `ifx` | - | fpm ✅  cmake ✅ | fpm ✅  cmake ❌ |
| `lfortran` | fpm ❌  cmake ❌ | fpm ❌  cmake ❌ | fpm ❌  cmake ❌ |
| `nvfortran` | - | fpm ✅  cmake ✅ | - |
<!-- STATUS:setup-fortran-conda:END -->

## API documentation

The most up-to-date API documentation for the master branch is available
[here](https://gha3mi.github.io/fordebug/).
To generate the API documentation for `ForDebug` using
[ford](https://github.com/Fortran-FOSS-Programmers/ford) run the following
command:

```shell
ford README.yml
```

## Contributing

Contributions to `ForDebug` are welcome!
If you find any issues or would like to suggest improvements, please open an issue.

## See also

- https://github.com/plevold/fortran-debug-utils.
