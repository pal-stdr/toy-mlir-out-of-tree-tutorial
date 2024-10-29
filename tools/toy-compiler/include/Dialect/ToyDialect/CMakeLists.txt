# Added in Ch 2.0.
# Set dialect name (i.e. "Toy") and namespace (i.e. "toy")
# Following variables will be first used in "lib/Dialect/ToyDialect/CMakeLists.txt".
# Then from there, they will passed to "include/Dialect/ToyDialect/CMakeLists.txt"
set(DIALECT_NAME "Toy")
set(DIALECT_NAMESPACE "toy")
set(TOY_CHAPTER "Ch20")


# ======== Autogenerating .inc headers (Starts) ========

# Mandatory
set(LLVM_TARGET_DEFINITIONS "${DIALECT_NAME}DialectBase.td")

# generated header name for ${DIALECT_NAME} == "Toy", ToyDialectBase.h.inc and ToyDialectBase.cpp.inc
mlir_tablegen("${DIALECT_NAME}DialectBase.h.inc" -gen-dialect-decls -dialect="${DIALECT_NAMESPACE}")
mlir_tablegen("${DIALECT_NAME}DialectBase.cpp.inc" -gen-dialect-defs -dialect="${DIALECT_NAMESPACE}")

# i.e. Inc target name is "ToyCh20IncGen".
# "lib/Dialect/ToyDialect/CMakeLists.txt" will call "ToyCh20IncGen" as a dependency to generate the .inc headers before running the compilation.
set(INC_GEN_TARGET_NAME "${DIALECT_NAME}${TOY_CHAPTER}IncGen")
add_public_tablegen_target("${INC_GEN_TARGET_NAME}")


# ======== Autogenerating .inc headers (Ends) ========




# Generate Dialect's ".md" Documentation
# Arguments:
# doc_filename: The name of your dialect file. i.e. "${dialect_name}DialectBase.td"
# output_file_name: The name of the output doc file. Whatever you want, you can set it.
# output_directory: Where you want to have it. Default prefix path is "build/docs/your-set-dir/". i.e. set it to "your-set-dir/".
# command: i.e. "-gen-op-doc"
# Example: add_mlir_doc_customized("ToyOps" "ToyOps" "ToyDialect/" "-gen-op-doc")
# Output:
# "${output_file_name}.md" in "build/docs/${output_directory}" dir
# How to activate the doc gen?
# In "build-mlir-18.sh" file, set "cmake --build . --target mlir-doc"
add_mlir_doc_customized("ToyDialectBase" "ToyDialectBase" "ToyDialect/" "-gen-dialect-doc")