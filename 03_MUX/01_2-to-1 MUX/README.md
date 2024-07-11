# 2-to-1 Multiplexers

This repository contains two Verilog modules that implement 2-to-1 multiplexers using different approaches: a conditional operator and tristate buffers. These modules can be used in digital circuit design for selecting one of the two input signals based on a control signal.

## Files

- `modeling_2_to_1_mux.v`: This file contains a 2-to-1 multiplexer implemented using a conditional operator.
- `tristate_2_to_1_mux.v`: This file contains a 2-to-1 multiplexer implemented using tristate buffers.

## Module Descriptions

### Waveform
![2-to-1 MUX waveform](https://velog.velcdn.com/images/foodinsect/post/bae92d49-0541-43f4-9323-462c5be11277/image.png)


### 1. Modeling 2-to-1 Multiplexer (`modeling_2_to_1_mux.v`)

This module uses a conditional operator to select one of the two input signals based on a control signal.

#### Ports:
- `in0` (input wire): Input signal 0.
- `in1` (input wire): Input signal 1.
- `control` (input wire): Control (select) signal.
- `out` (output wire): Output signal.

#### Functionality:
The output `out` is determined by the control signal `control`. If `control` is 1, `out` will be equal to `in1`. If `control` is 0, `out` will be equal to `in0`.

#### RTL Schematic:
![2-to-1 mux](https://velog.velcdn.com/images/foodinsect/post/c48e216f-5265-4a84-adab-823249811343/image.png)


### 2. Tristate 2-to-1 Multiplexer (`tristate_2_to_1_mux.v`)

This module uses tristate buffers to select one of the two input signals based on a select signal.

#### Ports:
- `x` (input wire): Input signal x.
- `y` (input wire): Input signal y.
- `s` (input wire): Select signal.
- `f` (output wire): Output signal.

#### Functionality:
The output `f` is determined by the select signal `s`. If `s` is 0, `f` will be equal to `x`. If `s` is 1, `f` will be equal to `y`.

#### RTL Schematic:
![tristate_2-to-1 mux](https://velog.velcdn.com/images/foodinsect/post/5946b154-f12e-431d-a532-db2c43deaf84/image.png)
