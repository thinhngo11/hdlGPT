module decoder_4to16 (
    input wire [3:0] sel,
    output reg [15:0] out
);

always @(*) begin
    out = 16'b0; // Initialize all outputs to 0
    case (sel)
        4'b0000: out[0] = 1;
        4'b0001: out[1] = 1;
        4'b0010: out[2] = 1;
        4'b0011: out[3] = 1;
        4'b0100: out[4] = 1;
        4'b0101: out[5] = 1;
        4'b0110: out[6] = 1;
        4'b0111: out[7] = 1;
        4'b1000: out[8] = 1;
        4'b1001: out[9] = 1;
        4'b1010: out[10] = 1;
        4'b1011: out[11] = 1;
        4'b1100: out[12] = 1;
        4'b1101: out[13] = 1;
        4'b1110: out[14] = 1;
        4'b1111: out[15] = 1;
    endcase
end

endmodule
