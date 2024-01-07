set(LLVM_TARGET_DEFINITIONS Ops.td)
mlir_tablegen(Ops.h.inc -gen-op-decls)
mlir_tablegen(Ops.cpp.inc -gen-op-defs)
mlir_tablegen(Dialect.h.inc -gen-dialect-decls)
mlir_tablegen(Dialect.cpp.inc -gen-dialect-defs)

# Defining the target alias "ToyCh2OpsIncGen". This alias will be called as a dependency to tools/toy-compiler/lib/Dialect/Dialect.cpp

# Means, before the actual compilation starts, all the mlir_tablegen() commands will be executed by cmake; in order to produce those .h.inc, .inc type headers.

# They will be generated at build/tools/toy-compiler/include/Dialect/ dir. Donot be confused.

# That's why we have to point this include location at "tools/toy-compiler/CMakeLists.txt" as "include_directories("${STANDALONE_BINARY_DIR}/tools/toy-compiler/include")"
add_public_tablegen_target(ToyCh2OpsIncGen)