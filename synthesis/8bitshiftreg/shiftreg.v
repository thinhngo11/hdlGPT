module loadable_shift_register (
    input wire clk,
    input wire reset,
    input wire load,
    input wire [7:0] data_in,
    input wire shift_in,
    output reg [7:0] data_out
);

reg [7:0] shift_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 8'b0;
    end
    else begin
        if (load) begin
            shift_reg <= data_in;
        end
        else begin
            shift_reg <= {shift_reg[6:0], shift_in};
        end
    end
end

assign data_out = shift_reg;

endmodule
