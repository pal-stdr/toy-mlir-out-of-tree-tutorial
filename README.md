# MLIR Toy Tutorial as an out-of-tree project

```sh
version: LLVM 18.0.0
commit: ecf881838045985f381003cc27569c73a207d0cc
Date: Tue Jan 2 12:06:27 2024 +0100
```

## TUTORIAL INDEX (`git` branch wise)
- `ch-0-0-build-llvm`: gives the overview of this tutorial and how to build [llvm-project](https://github.com/llvm/llvm-project) from source.
- `ch-0-1-prep-mlir-template`: How to collect and setup the `MLIR out-of-tree` template.
- `ch-0-2-prep-toy-scaffold`: How to setup just `Toy` compiler project scaffold. [Note: Without using/collecting the lexer, parser codes.]
- `ch-1-toy-parser`: How to collect & setup lexer, parser from `llvm-18-src-build` (i.e. `llvm-project`) for Toy language.
- More coming....


## ====== CHAPTER 0-0 Starts ======


## Objective

- Build `LLVM` from src.


## Git Branch name

- `ch-0-0-build-llvm`


## How To?

Officially this `CHAPTER 0-0` doesn't exists in [Official Toy Tutorial](https://mlir.llvm.org/docs/Tutorials/Toy/) 😅. Here, `0` means started from absolute `0`. The first step is to build `llvm-project` from src.

- If you are a complete newbie to `LLVM`, `LLVM` or compiler world, follow [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.1.SETUP-LLVM-for-NEWBIES.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.1.SETUP-LLVM-for-NEWBIES.md).

- If you are already familiar with the concepts, then follow [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.2.SETUP-LLVM-for-ADVANCED-USERS.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.2.SETUP-LLVM-for-ADVANCED-USERS.md). If you need clarifications/explanations for some steps, jump to [0.0.1.SETUP-LLVM-for-NEWBIES.md](Docs/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.1.SETUP-LLVM-for-NEWBIES.md).

- If you want to install `clang`, `llvm` without building it, use Ubuntu `update-alternatives` method & read [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/HOW-TO-MANAGE-MULTIVERSION-gcc-clang-LLVM-WITH-update-alternatives.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/HOW-TO-MANAGE-MULTIVERSION-gcc-clang-LLVM-WITH-update-alternatives.md) tuto. **BUT NOT RECOMMENDED at all FOR THIS TUTO.**

- (OPTIONAL, for VSCode users) The [VS Code settings](.vscode/) for the entire tuto series. E.g. ENV var like this one `${env:LLVM_AND_CLANG_INCLUDE_PATH}` used in [c_cpp_properties.json](.vscode/c_cpp_properties.json), came from the ENV vars in `$HOME/.profile` setup for LLVM, which you [can find in line 231 of 0.0.2.Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.2.SETUP-LLVM-for-ADVANCED-USERS.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.2.SETUP-LLVM-for-ADVANCED-USERS.md)


## ====== CHAPTER 0-0 Ends ======




In advance, sorry for too much "bla bla bla..." in this intro README. But it is for them, who are completely newbie to this compiler/LLVM/MLIR world. And I think these prep talks are absolutely necessary to draw a 30,000 ft' bird's eye view in their mind. If you are already familiar with LLVM, or compiler world, feel free to skip all the explanations; and directly jump to the section `How to Use this Tutorial`.

## Some thoughts from my part

- **I do not claim any ownership or authorship of this repo**. All the codes are collected from [Official Toy Language Tutorial Series](https://mlir.llvm.org/docs/Tutorials/Toy/).
- The only motivation to do this repo, is to help those, who have no prior knowledge on `MLIR` or `LLVM` or even on compiler details.
- Why this motivation? Because, it is highly likely that, those people will face almost the similar hurdle as me.


## What you will learn here..
- How to build `LLVM` for `MLIR`. You can use the same build for other purpose too 😉 (e.g. using `clang`/`clang++` as your regular compiler, instead of `gcc`/`g++`)! The version `18` is used for both `LLVM` & `MLIR`.
- How to setup & work with MLIR `out-of-tree` project. What is an `out-of-tree` project, [briefly discussed here](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.1.SETUP-MLIR-OUT-OF-TREE-TEMPLATE.md).
- How to play with `cmake`.
- How to organize the project scaffold. Feel free to choose your own after you finish this tuto.
- Walkthrough on [Official Toy Tutorial](https://mlir.llvm.org/docs/Tutorials/Toy/) with code.
- Explanation of most important details.


## Who are the target audience?

- Anybody who are enthusiast on `MLIR`.
- Specially who has no prior knowledge on `LLVM` or `MLIR`.
- People from different academic background. Atleast possess bare minimum development/script writing/programming experience with `c` or, `c++` or, `python` or, `js`, etc.
- Have a dire hunger to know or curiosity **"What really happens inside a programming language?"** Actually I am from this group 😅.
- For students, who want to learn, how to make a complier with `MLIR`. Or, even want to build awesome Bachelor, Masters or even PhD projects.
- **Most important: It doesn't matter if you don't have a CS bachelor degree. I don't 😉. But one day, still you can be an awesome compiler engg. 😀**


## How to Use this Tutorial
- This tutorial will follow the [Official Toy Language Tutorial Series](https://mlir.llvm.org/docs/Tutorials/Toy/) from [MLIR official website](https://mlir.llvm.org/)
- **Starting with the initial `LLVM` + `MLIR` setup, all the other chapters will be organized in `git` branches.**
- The project scaffolding is reorganized. But the used codes are almost same as the official tutorial.
- Main idea is to give a birds-eye-view on, how all the chapters are progressively advanced in the form of `git` `branches`, and finally how all pieces are joined together.
- Name of the official toy language compiler is `toyc` (i.e. `toyc.cpp`). But here it is renamed to `toy-compiler` (i.e. `toy-compiler.cpp`).
- **From `LLVM` + `MLIR` setup to project scaffolding is thoroughly discussed in this tuto.**
- **But for rest, you have to rely on only reading documentations written in code files.**
- Why the rest is not thoroughly discussed? Because, it almost impossible to note everything in `README.md` type file. It would take ages. Moreover, if I write in details, they will be so much confusing that, might become not-understandable at all. So I really beg your pardon.
- But still I will try to write most important points, that you need to understand.
- ENJOY! 😃😃😃😃


## How/Where to ask questions/doubts

Please use github issue thread for asking about your doubts, issues or bugs. I am still learning myself 😁. So please don't expect I can answer all the questions 😉.


## Prerequisites

- `LLVM` + `MLIR` of version `18`

- Setup `LLVM`. If you are completely new to `LLVM`, then use [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.1.SETUP-LLVM-for-NEWBIES.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.1.SETUP-LLVM-for-NEWBIES.md) to setup `LLVM-18`.

- If you already know how to setup `LLVM`, then use [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.2.SETUP-LLVM-for-ADVANCED-USERS.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.2.SETUP-LLVM-for-ADVANCED-USERS.md). If you need further clarification on, why I have used such installation methodology + technique, you can still read [0.0.1.SETUP-LLVM-for-NEWBIES.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.0.1.SETUP-LLVM-for-NEWBIES.md).

- If you want to install `clang`, `llvm` without building it, use Ubuntu `update-alternatives` method & read [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/HOW-TO-MANAGE-MULTIVERSION-gcc-clang-LLVM-WITH-update-alternatives.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/HOW-TO-MANAGE-MULTIVERSION-gcc-clang-LLVM-WITH-update-alternatives.md) tuto. **BUT NOT RECOMMENDED FOR THIS TUTO.**

- For setting up the `MLIR` template as out-of-tree project, read [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM/0.1.SETUP-MLIR-OUT-OF-TREE-TEMPLATE.md](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.1.SETUP-MLIR-OUT-OF-TREE-TEMPLATE.md). This `doc` will be available from `git` branch `ch-0-1-prep-mlir-template`.


## 1. Where to find `Toy` code + dev assets + binaries & How to use them

I assume, you have already build the [llvm-project](https://github.com/llvm/llvm-project) from source, and the renamed the src folder to `llvm-18-src-build` from `llvm-project`. The [LLVM build process](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM) is described in details. If you didn't build it, I'd recommend you to build it first.

### 1.1. How the `Toy` examples are already build with `llvm` src

When we configured the `llvm-18-src-build` with `-DLLVM_BUILD_EXAMPLES=ON` parameter, that also builds the Toy binaries which could be found at `/path/to/llvm-18-src-build/build/bin/toyc-ch1` or `/path/to/llvm-18-src-build/installation/examples/`.

### 1.2. Where to find the `Toy` development src code (i.e. `lexer`, `parser`, `MLIRGen`, `.cpp`, etc.)?
You can find it inside your src dir `llvm-18-src-build`. All the codes are organized there, into different chapters following the [Official Toy Tutorial](https://mlir.llvm.org/docs/Tutorials/Toy/)

```sh
# You will find toy dev code here
/path/to/llvm-18-src-build/mlir/examples/toy
```

### 1.3. Where to find the `Toy` language code (i.e. `ast.toy`, `codegen.toy`, `scalar.toy`, etc.)?

Here also the codes are organized there, into different chapters following the [Official Toy Tutorial](https://mlir.llvm.org/docs/Tutorials/Toy/)

```sh
# You will find toy code here
/path/to/llvm-18-src-build/mlir/test/Examples/Toy/
```


### 1.4. How to play with already build `Toy` code + assets + binaries that come with `llvm-18-src-build`

- You have build the `llvm-18-src-build` first to get those bins. The process is described in [Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM folder](Docs/TOY-TUTO/0.LLVM+MLIR-initial-setup-docs/0.0.SETUP-LLVM) in great details.
- **We can use those bins to cross check or test our binary outputs.**

```sh
/path/to/llvm-18-src-build/build/bin/toyc-ch1 /path/to/llvm-18-src-build/mlir/test/Examples/Toy/Ch1/ast.toy -emit=ast
# Or,
/path/to/llvm-18-src-build/installation/examples/toyc-ch1 /path/to/llvm-18-src-build/mlir/test/Examples/Toy/Ch1/ast.toy -emit=ast
```