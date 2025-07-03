# Compilers & Interpreters Project - Semantic Analysis and Code Generator

## Overview

This repository contains the final stage of a compiler project developed as part of the **Compilers & Interpreters** course during the second semester of 2024. The project focuses on implementing the **Semantic Analysis** and **Code Generation** phases of a compiler for a subset of the C programming language. The compiler performs lexical, syntactic, and semantic analysis, and generates assembly code (for Windows or Linux) if no errors are encountered.

### Key Features:
- **Lexical Analysis**: Detects and reports lexical errors while recovering gracefully to avoid cascading errors.
- **Syntax Analysis**: Parses the input code and reports syntactic errors with detailed messages.
- **Semantic Analysis**: Checks for semantic errors such as undefined variables, double definitions, and validates `break`/`continue` usage.
- **Code Generation**: Translates valid code into assembly language, supporting:
  - Global variable declarations.
  - Arithmetic and boolean expressions.
  - Control structures (`if-else`, `while`).
- **Symbol Table**: Displays variable names, types, and scopes (globals, locals, parameters).
- **Error Handling**: Provides comprehensive error listings for all phases.

---

## Project Structure

The project is divided into three stages, each building on the previous one:
1. **Scanner (Lexical Analysis)**: Uses JFlex to tokenize input and detect lexical errors.
2. **Parser (Syntax Analysis)**: Uses CUP to validate syntax against a defined grammar.
3. **Semantic Analyzer & Code Generator**: Implements semantic checks and translates code to assembly.

### Deliverables:
- **Outputs**:
  - Lists of lexical, syntactic, and semantic errors.
  - Symbol table contents.
  - Generated assembly code (if no errors).
- **Documentation**: Includes solution strategy, test cases, user manual, and lessons learned.

---

## Team Members
- **Steven Sequeira**
- **Dayana Xie**
- **José Pablo Quesada**

---

## Tools & Technologies
- **Java**: Primary implementation language.
- **JFlex**: Lexical analyzer generator.
- **CUP**: Parser generator for syntax analysis.

---

## References
- [JFlex Manual](http://www.jflex.de/index.html)
- [CUP Manual](http://www.cs.princeton.edu/~appel/modern/java/CUP/manual.html)
