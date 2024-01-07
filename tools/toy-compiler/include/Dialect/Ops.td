//===- Ops.td - Toy dialect operation definitions ----------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Defines the operations of the Toy dialect.
//
//===----------------------------------------------------------------------===//

#ifndef TOY_OPS
#define TOY_OPS

include "mlir/IR/OpBase.td"
include "mlir/Interfaces/FunctionInterfaces.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/Interfaces/SideEffectInterfaces.td"



// Provide a definition of the 'toy' dialect in the ODS framework so that we
// can define our operations.
def Toy_Dialect : Dialect {
    let name = "toy";
    let summary = "A high-level dialect for analyzing and optimizing the Toy language";

    // A much longer description of our dialect.
    let description = [{
        The Toy language is a tensor-based language that allows you to define functions, perform some math computation, and print results. This dialect provides a representation of the language that is amenable to analysis and optimization.
    }];

    let cppNamespace = "::mlir::toy";
}




// Base class for toy dialect operations. This operation inherits from the base
// `Op` class in OpBase.td, and provides:
//   * The parent dialect of the operation.
//   * The mnemonic for the operation, or the name without the dialect prefix.
//   * A list of traits for the operation.
class Toy_Op<string mnemonic, list<Trait> traits = []> :
    Op<Toy_Dialect, mnemonic, traits>;



// We will define rest of the toy operations (i.e. 1.ConstantOp, 2.AddOp, 3.FuncOp,
// 4.GenericCallOp, 5.MulOp, 6.PrintOp, 7.ReshapeOp, 8.ReturnOp, 9.TransposeOp) by inheriting
// from our base 'Toy_Op' class above.
// Here we provide the mnemonic and a list of traits for the operation. The
// constant operation is marked as 'Pure' as it is a pure operation
// and may be removed if dead.

//===----------------------------------------------------------------------===//
// Toy Operations
//===----------------------------------------------------------------------===//



//===----------------------------------------------------------------------===//
// 1. ConstantOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 2. AddOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 3. FuncOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 4. GenericCallOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 5. MulOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 6. PrintOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 7. ReshapeOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 8. ReturnOp
//===----------------------------------------------------------------------===//




//===----------------------------------------------------------------------===//
// 9. TransposeOp
//===----------------------------------------------------------------------===//




#endif // TOY_OPS