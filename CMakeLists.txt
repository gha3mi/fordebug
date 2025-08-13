cmake_minimum_required(VERSION 3.18)

project(ForDebug LANGUAGES Fortran)
set(PROJECT_AUTHOR "Seyed Ali Ghasemi")
set(PROJECT_MAINTAINER "info@gha3mi.com")
set(PROJECT_LICENSE "BSD-3-Clause")
set(PROJECT_URL "https://github.com/gha3mi/fordebug")
string(TOLOWER "${PROJECT_NAME}" PROJECT_NAME_LOWER)
string(TOUPPER "${PROJECT_NAME}" PROJECT_NAME_UPPER)

# options
option(BUILD_SHARED_LIBS "Build shared libraries by default" OFF)
option(${PROJECT_NAME_UPPER}_BUILD_EXAMPLES "Build example programs" OFF)
option(${PROJECT_NAME_UPPER}_BUILD_TESTS "Build unit tests" OFF)

# mod directory
set(Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mod)

# compiler
if(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -cpp -Wall -Wextra -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single -fPIC -fimplicit-none -Werror=implicit-interface -ffree-form -Wno-maybe-uninitialized")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -cpp -fPIC -march=native -O3 -funroll-loops -Wimplicit-interface -fmax-errors=1 -fcoarray=single -fimplicit-none -Werror=implicit-interface -ffree-form")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -cpp -Wall -Wextra -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single -fPIC -fimplicit-none -Werror=implicit-interface -ffree-form -Wno-maybe-uninitialized")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -cpp -march=native -O3 -funroll-loops -Wimplicit-interface -fPIC -fmax-errors=1 -fcoarray=single -fimplicit-none -Werror=implicit-interface -ffree-form")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -cpp -Wall -Wextra -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single -fPIC -fimplicit-none -Werror=implicit-interface -ffree-form -Wno-maybe-uninitialized")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -cpp -march=native -O3 -funroll-loops -Wimplicit-interface -fmax-errors=1 -fcoarray=single -fPIC -fimplicit-none -Werror=implicit-interface -ffree-form")
    endif()

elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "IntelLLVM")
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -fpp -diag-error 10006 -check all,nouninit -error-limit 1 -O0 -g -assume byterecl -traceback -fPIC -free")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -fpp -O3 -fp-model precise -pc64 -align all -error-limit 1 -reentrancy threaded -nogen-interfaces -assume byterecl -fPIC -free")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} /fpp /Qdiag-error:10006 /check:all /check:nouninit /error-limit:1 /Od /Z7 /debug:full /assume:byterecl /traceback /free")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} /fpp /O3 /fp:precise /align:all /error-limit:1 /reentrancy:threaded /nogen-interfaces /assume:byterecl")
    endif()

elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "NVHPC")
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -cpp -Minform=inform -Mbackslash -Mbounds -Mchkptr -Mchkstk -traceback -fPIC -mp -Mfree")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -cpp -O3 -fPIC -stdpar=multicore,gpu -Mbackslash -mp -Mfree")
    endif()

elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "LLVMFlang")
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -cpp -fPIC -g")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -cpp -fPIC")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -cpp -fPIC -g")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -cpp -fPIC")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -cpp -g")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -cpp")
    endif()

elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "LFortran")
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} --cpp -fPIC --verbose -g")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} --cpp -fPIC")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} --cpp -fPIC --verbose -g")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} --cpp -fPIC")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} --cpp -fPIC --verbose -g")
        set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} --cpp -fPIC")
    endif()
endif()

# dependencies
set(FETCHCONTENT_BASE_DIR ${CMAKE_BINARY_DIR}/dependencies CACHE PATH "Base directory for dependencies")
include(FetchContent)

# OpenMP
find_package(OpenMP)
if(OpenMP_Fortran_FOUND)
    message(STATUS "OpenMP found and enabled")
endif()

# Required: fortime
set(BUILD_TEST OFF CACHE BOOL "" FORCE)
FetchContent_Declare(
    fortime
    GIT_REPOSITORY https://github.com/gha3mi/fortime.git
    GIT_TAG main
)
FetchContent_MakeAvailable(fortime)


# targets
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "src/*.[fF]90")

add_library(${PROJECT_NAME_LOWER} ${SOURCES})
add_library(${PROJECT_NAME_LOWER}::${PROJECT_NAME_LOWER} ALIAS ${PROJECT_NAME_LOWER})

set_target_properties(${PROJECT_NAME_LOWER} PROPERTIES
    Fortran_MODULE_DIRECTORY ${Fortran_MODULE_DIRECTORY}
)

target_link_libraries(${PROJECT_NAME_LOWER}
  PUBLIC
    $<BUILD_INTERFACE:fortime>
    $<INSTALL_INTERFACE:fortime::fortime>
)

target_include_directories(${PROJECT_NAME_LOWER} PUBLIC
    $<BUILD_INTERFACE:${Fortran_MODULE_DIRECTORY}>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

if(OpenMP_Fortran_FOUND)
    target_link_libraries(${PROJECT_NAME_LOWER} PUBLIC OpenMP::OpenMP_Fortran)
endif()


# install
include(GNUInstallDirs)

install(TARGETS ${PROJECT_NAME_LOWER}
    EXPORT ${PROJECT_NAME_LOWER}-targets
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(DIRECTORY ${Fortran_MODULE_DIRECTORY}/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    FILES_MATCHING PATTERN "*.mod"
)

install(EXPORT ${PROJECT_NAME_LOWER}-targets
    FILE ${PROJECT_NAME_LOWER}-targets.cmake
    NAMESPACE ${PROJECT_NAME_LOWER}::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME_LOWER}
)

install(FILES "${CMAKE_SOURCE_DIR}/VERSION" "${CMAKE_SOURCE_DIR}/LICENSE"
    DESTINATION ${CMAKE_INSTALL_DOCDIR}
)

# install(DIRECTORY "${CMAKE_SOURCE_DIR}/doc/"
#   DESTINATION ${CMAKE_INSTALL_DOCDIR}
#   FILES_MATCHING PATTERN "*"
# )


# package config
include(CMakePackageConfigHelpers)

configure_package_config_file(
    cmake/package_config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWER}-config.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME_LOWER}
    PATH_VARS CMAKE_INSTALL_INCLUDEDIR
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWER}-config.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME_LOWER}
)


# tests
if(${PROJECT_NAME_UPPER}_BUILD_TESTS)
    enable_testing()

    file(GLOB TESTS CONFIGURE_DEPENDS test/*.f90 test/*.F90)
    foreach(test_file ${TESTS})
        get_filename_component(test_name ${test_file} NAME_WE)
        add_executable(${test_name} ${test_file})
        target_link_libraries(${test_name} PRIVATE ${PROJECT_NAME_LOWER} fortime)

        add_test(NAME ${test_name}
            COMMAND ${test_name}
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        )

        target_include_directories(${test_name} PRIVATE
            ${Fortran_MODULE_DIRECTORY}
        )

        if(OpenMP_Fortran_FOUND)
            target_link_libraries(${test_name} PRIVATE OpenMP::OpenMP_Fortran)
        endif()
    endforeach()
endif()


# examples
if(${PROJECT_NAME_UPPER}_BUILD_EXAMPLES)

    file(GLOB EXAMPLES CONFIGURE_DEPENDS example/*.f90 example/*.F90)
    foreach(example_file ${EXAMPLES})
        get_filename_component(example_name ${example_file} NAME_WE)
        add_executable(${example_name} ${example_file})
        target_link_libraries(${example_name} PRIVATE ${PROJECT_NAME_LOWER})

        # Link additional libraries depending on example name
        target_link_libraries(${example_name} PRIVATE fortime)

        target_include_directories(${example_name} PRIVATE
            ${Fortran_MODULE_DIRECTORY}
        )

        if(OpenMP_Fortran_FOUND)
            target_link_libraries(${example_name} PRIVATE OpenMP::OpenMP_Fortran)
        endif()
    endforeach()
endif()


# uninstall target
configure_file(
    ${CMAKE_SOURCE_DIR}/cmake/uninstall.cmake.in
    ${CMAKE_BINARY_DIR}/uninstall.cmake
    @ONLY
)

add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -P ${CMAKE_BINARY_DIR}/uninstall.cmake
)
