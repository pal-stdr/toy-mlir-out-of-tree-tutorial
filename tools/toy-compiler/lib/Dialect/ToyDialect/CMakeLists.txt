# "MLIRToyDialectCPP" is the alias through which tools/toy-compiler/CMakeLists.txt will target this lib
add_mlir_dialect_library(MLIRToyDialectBaseCPP
    ToyDialectBase.cpp

    DEPENDS
    ToyCh20IncGen # <= Telling cmake to trigger the generation of .inc headers first.
)