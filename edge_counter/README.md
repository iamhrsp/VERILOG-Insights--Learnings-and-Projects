# Edge Counter

This design counts the number of **rising edges** on an input signal. It does this by using:

1. An **edge detector** that outputs a one‐cycle pulse whenever its input goes from `0` to `1`.
2. A **counter** that increments once each time it receives that pulse.
3. A **top‐level module** (`edge_counter`) that wires these two pieces together.

### Component diagram for better understanding

![component Diagram](https://github.com/iamhrsp/VERILOG-Insights--Learnings-and-Projects/blob/main/edge_counter/figures/dia3.JPG)


## How It Works

1. **Edge Detector**
   - It keeps track of the previous value of `in_signal` in a register (`val`).
   - Each clock cycle, it updates `val` to the current `in_signal`.
   - Its output (`out_strobe`) is `1` for one clock cycle if `in_signal` was `0` and has just become `1` (a rising edge).

2. **Counter**
   - Has an 8‐bit register (`out_value`) that starts at 0.
   - Each clock cycle:
     - If `in_reset` is `1`, `out_value` resets to 0.
     - Otherwise, if `in_enable` is `1`, it increments by 1.
   - Outputs its count on `out_value`.

3. **Top‐Level (`edge_counter`)**
   - Instantiates the `edge_detector` and `counter`.
   - Connects the edge detector’s `out_strobe` to the counter’s `in_enable`.
   - Also exposes `out_strobe` as `out_pulse` so you can observe the pulse.
   - The counter’s output (`out_value`) is mapped to `out_count`.

### Waveforms

**Timing diagram of edge detection**

![ed_detector](https://github.com/iamhrsp/VERILOG-Insights--Learnings-and-Projects/blob/main/edge_counter/figures/dia1.JPG)

**Timing diagram of edge counter**

![ed_counter](https://github.com/iamhrsp/VERILOG-Insights--Learnings-and-Projects/blob/main/edge_counter/figures/dia2.JPG)


