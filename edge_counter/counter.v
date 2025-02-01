module counter (
    input in_clock, in_reset, in_enable,
    output reg [7:0] out_value
);

initial out_value = 0;
always @(posedge in_clock) begin
    if (in_reset)
        out_value <= 0;
    else if (in_enable)    
         out_value <= out_value + 1; 
    else 
        out_value <= out_value;
end

endmodule


/*if (out_value == 8'hFF) 
                out_value <= 1;
            else 
What about if for the max value counter needs to be reset*/