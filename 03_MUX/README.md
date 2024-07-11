
# 🍳 Concept of MUX

A Multiplexer (MUX) is a combinational circuit that selects one of many input signals and forwards the selected input to a single output line. The selection of the input line is controlled by a set of selection lines. The key idea behind a multiplexer is to manage multiple data inputs while using fewer output lines, making it a crucial component in various digital systems, including data routing, signal multiplexing, and efficient resource utilization.

**Basic Operation**:
- **Selection Lines**: Determine which input line to send to the output.
- **Input Lines**: Multiple data inputs that the multiplexer can choose from.
- **Output Line**: Single output that carries the selected input signal.

---

# 🚩 Folder Descriptions

## [01_2-to-1 MUX](https://github.com/foodinsect/basic-module/tree/main/03_MUX/01_2-to-1%20MUX)

This directory contains the design and implementation of a simple 2-to-1 multiplexer. This MUX has two data inputs, one selection line, and one output. The design includes:
- **Basic MUX**: Using standard logic gates to perform the selection.
- **Tri-State MUX**: Utilizing tri-state buffers to implement the MUX functionality.

---

## [02_4-to-1 MUX](https://github.com/foodinsect/basic-module/tree/main/03_MUX/02_4-to-1%20MUX)

This directory contains the design of a 4-to-1 multiplexer using different modeling techniques and design strategies:
- **Structural Modeling**: Building the MUX using basic logic gates and interconnections.
- **Dataflow Modeling**: Using continuous assignments to describe the behavior of the MUX.
- **Behavioral Modeling**: Using `if-else` statements, `case` statements, and nesting to describe the MUX behavior.
- **Tri-State Buffers**: Incorporating tri-state buffers for efficient design and control.

The directory showcases various design approaches to implement the 4-to-1 MUX, emphasizing the versatility and flexibility of each method.

---

## [03_N bit 4-to-1 MUX](https://github.com/foodinsect/basic-module/tree/main/03_MUX/03_N%20bit%204-to-1%20MUX)

This directory contains the design of an N-bit 4-to-1 multiplexer using parameterized modules. The design leverages:
- **Generate Statement**: To create scalable and reusable MUX designs for N-bit inputs.
- **Case Statement**: For efficient control flow and selection logic.
- **Condition Control**: Including enable signals to control the MUX operation.
- **Behavioral Constructs**: Using advanced behavioral constructs to implement complex MUX functionalities.

The focus here is on creating flexible and scalable MUX designs that can be easily adapted for various bit-widths and control requirements.

---