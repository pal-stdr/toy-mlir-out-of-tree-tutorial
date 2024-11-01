# My Desktop
LLVM_PROJECT_ROOT=$MY_EXTERNAL_SDD_WORK_DIR/compiler-projects/llvm-18-src-build
# My Laptop
# LLVM_PROJECT_ROOT=$HOME/compiler-projects/llvm-18-src-build
# Add your $LLVM_PROJECT_ROOT path
# LLVM_PROJECT_ROOT=



BUILD_DIR=$LLVM_PROJECT_ROOT/build
PREFIX=$BUILD_DIR/lib/cmake/mlir


rm -R build/
mkdir -p build
cd build/

cmake   \
    -G Ninja    \
    -S ../  \
    -B .    \
    -DCMAKE_BUILD_TYPE=DEBUG    \
    -DLLVM_DIR=$BUILD_DIR       \
    -DMLIR_DIR=$PREFIX      \
    -DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit     \
    -DCMAKE_C_COMPILER=$BUILD_DIR/bin/clang    \
    -DCMAKE_CXX_COMPILER=$BUILD_DIR/bin/clang++    \
    -DLLVM_ENABLE_LLD=ON    \
    -DLLVM_PARALLEL_LINK_JOBS=1     



# We need this
cmake --build . --target toy-compiler

# To generate the dialect doc
cmake --build . --target mlir-doc

# We donot need them anymore
# cmake --build . --target standalone-opt
# cmake --build . --target standalone-translate






# Notes
# 1. -DLLVM_USE_LINKER=“lld”. In order to use lld linker, it has to be available in $PATH. Neither it would give error something like this "Host compiler does not support -fuse-ld=/path/to/compiler-projects/llvm-src-17-build/installation/bin/lld"
