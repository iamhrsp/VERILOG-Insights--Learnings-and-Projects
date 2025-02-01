module edge_counter (
    input in_clock, in_reset, in_signal,
    output out_pulse,
    output reg [7:0] out_count
);

wire wire_pulse;

edge_detector ed (
           .in_clock(in_clock),
           .in_signal(in_signal),
           .out_strobe(wire_pulse),
          );

counter c (.in_clock(in_clock), 
           .in_reset(in_reset), 
           .out_value(out_count),
           .in_enable(wire_pulse)
          );
assign wire_pulse = out_pulse;


endmodule

