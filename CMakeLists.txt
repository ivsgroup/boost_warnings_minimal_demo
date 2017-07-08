cmake_minimum_required (VERSION 3.8.1)

project(boost_warnings_minimal_demo)

function(activate_useful_msvc_warnings)
  if (MSVC)
    add_compile_options(/W3)  # level 3 warnings (it needs to be set, in order to reproduce the problem)
    # add_compile_options(/W4)  # level 4 warnings (works also)
    set(msvc_additional_warnings 
      # below is the warning that causes the problem (it needs to be set, in order to reproduce the problem)
      4265 # 'class': class has virtual functions, but destructor is not virtual

      # below are some more useful warning that are recommended (they are not needed to reproduce the problem)

      4263 # member function does not override any base class virtual member function) 
      4264 # no override available for virtual member function; function is hidden
      4242 # conversion from ‘type1’ to ‘type2’, possible loss of data
      4266 # no override available for virtual member function from base ‘type’; function is hidden
      4302 # truncation from ‘type 1’ to ‘type 2’
      4826 # conversion from ‘type1’ to ‘type2’ is sign-extended. This may cause unexpected runtime behavior
      4905 # wide string literal cast to ‘LPSTR’
      4906 # string literal cast to ‘LPWSTR’
      4389 # signed/unsigned mismatch
      4239 # nonstandard extension used: 'argument': conversion from T to T &
      4928 # illegal copy-initialization; more than one user-defined conversion has been implicitly applied
      4505 # unreferenced local function has been removed
      4191 # unsafe conversion from ‘type of expression’ to ‘type required’ 
    )


    foreach(warningNumber ${msvc_additional_warnings})  
      add_compile_options(/we${warningNumber})
    endforeach()
  endif()
endfunction()

# include_directories(boost_1_64_0) # boost 1.64.0 : will not compile
include_directories(boost_patched/boost_1_64_0-patched) # Patched version, will compile
activate_useful_msvc_warnings()
add_executable(hello hello.cpp)
