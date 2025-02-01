module edge_detector (
    input wire in_clock,
    input wire in_signal,
    output reg out_strobe
);

reg val;                                // Used to store the previous value
always @(posedge in_clock) begin
    val <= in_signal;
end

assign out_strobe = ~val & in_signal;       // Logic formed based on 0 to 1 transition

endmodule


/* So I basically, wrote the current output value based on the previous and current input value and made a truth table out of it.

previousvalue currentvalue currentoutput
0               0               0
0               1               1
1               0               0
1               1               0

The logic is  A' & B

*/