//===- ToyDialectBase.td - Toy dialect definition ----------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Definition of the Toy dialect.
//
// This file doesn't exist in official Toy tutorial
// Created for better organization and seperation
//
//
//===----------------------------------------------------------------------===//


#ifndef TOY_DIALECT
#define TOY_DIALECT


include "mlir/IR/OpBase.td"


/// Provide a definition of the 'ToyDialect' dialect in the ODS framework so that we
/// can register our operations to it.
def Toy_Dialect : Dialect {
    let name = "toy";
    let summary = "A high-level dialect for analyzing and optimizing the Toy language";

    // A much longer description of our dialect.
    let description = [{
        The Toy language is a tensor-based language that allows you to define functions, perform some math computation, and print results. This dialect provides a representation of the language that is amenable to analysis and optimization.
    }];

    let cppNamespace = "::mlir::toy";
}




#endif // TOY_DIALECT