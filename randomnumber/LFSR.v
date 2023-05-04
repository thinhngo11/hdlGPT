module lfsr8bit_rng(
    input wire clk,
    input wire rst,
    output reg [7:0] random_number
);

reg [7:0] lfsr;

// Galois LFSR using 8-bit taps: 8,6,5,4 (x^8 + x^6 + x^5 + x^4 + 1)
always @(posedge clk or posedge rst) begin
    if (rst) begin
        lfsr <= 8'h1; // Initialize the LFSR with a non-zero seed value
    end else begin
        lfsr <= {lfsr[6:0], lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3]};
    end
end

assign random_number = lfsr;

endmodule
