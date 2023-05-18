module mux_35_1(
  input [34:0] data_in,
  input [5:0] sel,
  output reg out
);

always @(*)
begin
  case(sel)
    6'b000001: out = data_in[0];
    6'b000010: out = data_in[1];
    6'b000100: out = data_in[2];
    6'b001000: out = data_in[3];
    6'b010000: out = data_in[4];
    6'b100000: out = data_in[5];
    default: out = 1'b0;
  endcase
end

endmodule
