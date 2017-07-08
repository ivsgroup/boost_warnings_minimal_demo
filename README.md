# boost_warnings_minimal_demo
A minimal demo that shows how to reproduce a warning inside `boost/exception/exception.hpp` with `Visual Studio 2015` (and probably other versions).

### Steps to reproduce the problem

* Run get_boost.sh : this will download boost 1.64.0 and create an original + a patched version.
* Run build.bat (this requires Visual Studio 2015)

The error we are getting is :
```
(ClCompile target) ->
  boost_warnings_minimal_demo\boost_1_64_0\boost/exception/exception.hpp(176): 
  error C4265: 'boost::exception_detail::error_info_container': 
  class has virtual functions, but destructor is not virtual
```


### Explanation 

error_info_container has a protected destructor, which is not virtual:  this is legitimate.

However, Visual Studio sees this as a bug, if you enable more warnings, like below 

```
add_compile_options(/W3)
add_compile_options(/we4265)
```

(see CMakeLists.txt for a more complete example)

### A possible patch is shown below:

```
--- a/boost/exception/exception.hpp
+++ b/boost_1_64_0-patched/boost/exception/exception.hpp
@@ -10,6 +10,7 @@
 #endif
 #if defined(_MSC_VER) && !defined(BOOST_EXCEPTION_ENABLE_WARNINGS)
 #pragma warning(push,1)
+#pragma warning(disable: 4265)
 #endif
 
 #ifdef BOOST_EXCEPTION_MINI_BOOST
```
