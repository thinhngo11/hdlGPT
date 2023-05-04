module encoder_8to3 (
    input [7:0] data,
    output reg [2:0] encoded_data
);

always @(*) begin
    case (data) // Only one of the inputs should be high at a time
        8'b0000_0001: encoded_data = 3'b000;
        8'b0000_0010: encoded_data = 3'b001;
        8'b0000_0100: encoded_data = 3'b010;
        8'b0000_1000: encoded_data = 3'b011;
        8'b0001_0000: encoded_data = 3'b100;
        8'b0010_0000: encoded_data = 3'b101;
        8'b0100_0000: encoded_data = 3'b110;
        8'b1000_0000: encoded_data = 3'b111;
        default: encoded_data = 3'b000; // Invalid input, default to 0
    endcase
end

endmodule
