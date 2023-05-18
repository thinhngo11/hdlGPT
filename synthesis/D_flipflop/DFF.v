module d_flip_flop (
    input wire D,
    input wire CLK,
    input wire RST,
    output reg Q
);

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        Q <= 1'b0; // Reset the flip-flop
    end else begin
        Q <= D; // Capture the input on the rising edge of the clock
    end
end

endmodule
