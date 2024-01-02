
# 1. Which one `add_subdirectory()` vs `add_library()` is to use for adding custom developed libs w.r.t MLIR?

Both `add_subdirectory()` and `add_library()` are commands used in CMake to manage project structure and dependencies. However, they serve distinct purposes:

**`add_subdirectory()`:** is used to include the contents of a subdirectory into the current CMake build process. It recursively processes the `CMakeLists.txt` files in the specified subdir. This is useful for organizing a project into multiple directories and managing separate components or modules. **But this is not for forming shared library (`.so`, `.dll`) or static library (`.a`, `.lib`).** **So if we just want to build the compiler bin, but not share libs, we `add_subdirectory()` is the choice.**


**`add_library()`:** is used to create a library target, which represents a collection of source files that are compiled and linked together to form a shared library (`.so`, `.dll`) or a static library (`.a`, `.lib`). Libraries can be used as dependencies for other executable targets or libraries. **So if we just want to build the shared libs, we `add_library()` is the choice.**


**Summary:** `add_subdirectory()` is for managing project structure and integrating subdirectories, while `add_library()` is for creating and managing library targets.


# 2. Difference between `PUBLIC` vs `PRIVATE` vs `INTERFACE` library in the context of MLIR

## 2.1. `PUBLIC` libraries:
Most widely visible and accessible type of library. **They are designed to be used by other libraries or applications, and they export all of their symbols (`functions`, `types`, `variables`) to the outside world.** Means that, any other library or application that linked against a public library, can access the public lib through `functions`, `types`, `variables` (i.e. `symbols`). Public libraries are typically used for general-purpose functionality that is intended to be shared by multiple projects.

MLIR has a number of public libraries such as `Pass Manager (PM)`, `Dialects` (i.e. `LLVM dialect`, `Affine dialect`, `Loop dialect`, `Arithmetic dialect` etc.), `Bindings`, etc.



## 2.2.`PRIVATE` libraries:
are designed to be used only by the library itself and its immediate dependencies. They do not export any of their symbols (`functions`, `types`, `variables`) to the outside world. And they can only be linked against by other libraries or applications that are explicitly marked as `PRIVATE` dependencies. Means, if we are declaring a lib as `PRIVATE`, and if this lib has dependencies with other libs, then those libs should be linked with our `PRIVATE` lib by explicitly declaring them as `PRIVATE` dependencies. **This is useful for hiding implementation details and preventing accidental symbol conflicts.** Also **`PRIVATE` libraries are typically used for libraries that contain proprietary or sensitive code.**

In other words, `PRIVATE` libraries are designed to be used by a specific group of people and they don't want to share their code with the outside world. This is because the code might be proprietary or sensitive, or because the library needs to be very tightly controlled.


### 2.2.1 More Easy way to Understand `PRIVATE` libs

**Example analogy 1:** Private libraries are like secret clubs. Only the people who are allowed in (the library itself and its immediate dependencies) can see what's inside. They don't tell anyone else what they're doing, and they don't want anyone else to mess with their stuff.

**Example analogy 2:** Imagine we're writing a secret recipe for a new type of cake. We don't want just anyone to be able to make our cake, so we keep the recipe private. Only we and our closest friends know how to make it. `PRIVATE` libs are similar. They're like secret recipes for code. **Only the library itself and its immediate dependencies know how to use them.**

**Usage example:**

**Q.** Does that mean, if I want to use external library with my PRIVATE library, then those external library has to be declared as PRIVATE dependencies?
**Ans:** YES! And the way to use that is following:

```cmake
add_library(my_private_library PRIVATE external_library)
```

## 2.3.`INTERFACE` libraries:
They are typically used to declare an API that other libraries or applications can conform to. This allows developers to use the API of an interface library without having to worry about the underlying implementation details. Interface libraries are typically used for libraries that are still under development or that are intended to be used by multiple projects with different implementation requirements.


**Usage example:**

Eigen: Eigen is another popular C++ library for numerical computation, with a focus on matrix operations. To target Eigen with the INTERFACE keyword, we can use the following CMake code:

```cmake
find_package(Eigen3 REQUIRED)

target_link_libraries(my_target INTERFACE Eigen3::Eigen3)
```


## 2.4. `cmake` STANDARD LIBRARY ORGANIZATION (BEST PRACTICE)

I have collected the following diagram from ["CMake: Best Practices" by Henry Schreiner , slide - 22](https://indico.jlab.org/event/420/contributions/7961/attachments/6507/8734/CMakeSandCroundtable.slides.pdf).

From this diagram, you can assume `Target: myprogram` as your `toy-compiler`.

<!-- ![Alt text](../../assets/images/image.png?raw=true "Title") -->
<!-- ![cmake LIBRARY BEST PRACTICE](../../assets/images/best_practices_cmake_lib_design.png =740x970) -->
<img src="../../assets/images/best_practices_cmake_lib_design.png" alt="drawing" width="740" height="840"/>