interface mux_if(input logic clk);
  logic [3:0] sel;
  logic [15:0] data_in;
  logic data_out;
endinterface
