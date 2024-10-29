# Collected from - https://github.com/llvm/llvm-project/blob/e302950023cd99251371c5dc8a1e3b609dd5a8fe/mlir/cmake/modules/AddMLIR.cmake#L162C1-L176C14
# Generate ".md" Documentation
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
function(add_mlir_doc_customized doc_filename output_file_name output_directory command)

    set(LLVM_TARGET_DEFINITIONS ${doc_filename}.td)

    # The MLIR docs use Hugo, so we allow Hugo specific features here.
    tablegen(MLIR ${output_file_name}.md ${command} -allow-hugo-specific-features ${ARGN})

    set(GEN_DOC_FILE ${STANDALONE_BINARY_DIR}/docs/${output_directory}${output_file_name}.md)

    # build/docs/output_directory/
    # message(STATUS "${GEN_DOC_FILE}")

    add_custom_command(
            OUTPUT ${GEN_DOC_FILE}
            COMMAND ${CMAKE_COMMAND} -E copy
                    ${CMAKE_CURRENT_BINARY_DIR}/${output_file_name}.md
                    ${GEN_DOC_FILE}
            DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${output_file_name}.md)
    add_custom_target(${output_file_name}DocGen DEPENDS ${GEN_DOC_FILE})
    add_dependencies(mlir-doc ${output_file_name}DocGen)

endfunction()