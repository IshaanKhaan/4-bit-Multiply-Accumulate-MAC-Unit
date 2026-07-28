# 4-bit Multiply-Accumulate (MAC) Unit

A 4-bit signed Multiply-Accumulate unit designed in Verilog HDL for arithmetic pipelines. Multiplies two 4-bit signed inputs each clock cycle and accumulates the running sum in an 8-bit register.

## Architecture

The design is split into three submodules combined in the top-level `Maclab9again`:

- **`mult`** - multiplies two 4-bit signed inputs (`A`, `B`), producing an 8-bit signed product
- **`addr`** - adds the new product to the current accumulator value
- **`accm`** - registers the running sum on each clock edge, with synchronous reset

Each cycle: `accumulator <= accumulator + (A * B)`

## Outputs

- **`Z_full`** - the full 8-bit signed accumulator value
- **`Z_trunc`** - a 4-bit truncated view, taking bits `[6:3]` of `Z_full` (equivalent to a divide-by-8 truncation). Note this window excludes the sign bit (bit 7), so it represents a coarse **unsigned magnitude view** of the accumulator rather than a fully sign-preserving scaled output - useful for downstream stages that only need an approximate magnitude reading.

## Verified Behavior

Simulated in Xilinx Vivado and validated on FPGA. Testbench applies a sequence of (A, B) pairs and confirms the accumulator correctly sums each product cycle-by-cycle, with synchronous reset correctly zeroing the accumulator when asserted.

Example trace (A, B -> accumulated Z_full):
- 2 x 3 = 6 -> accumulator = 6
- 1 x 4 = 4 -> accumulator = 10
- 3 x 2 = 6 -> accumulator = 16
- 2 x 2 = 4 -> accumulator = 20
- reset -> accumulator = 0

## Running the Simulation

Designed and simulated in **Xilinx Vivado**:

1. Add `mac_unit.v` as a design source and `testbench.v` as a simulation source
2. Set `Maclab9again_tb` as the top module for simulation
3. Run **Behavioral Simulation**

The design was also synthesized and validated on FPGA hardware.

## Files

- `mac_unit.v` - top-level MAC module and submodules (multiplier, adder, accumulator register)
- `testbench.v` - testbench applying a sequence of test vectors and verifying accumulator behavior

## Author

Ishan Khan - B.Tech ECE, Aligarh Muslim University
