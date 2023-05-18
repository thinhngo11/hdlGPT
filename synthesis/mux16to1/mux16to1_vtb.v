`timescale 1ns / 1ps

module tb_mux_16to1();

  reg [3:0] sel;
  reg [15:0] data_in;
  wire data_out;

  // Instantiate the mux_16to1 module
  mux_16to1 mux_inst (
    .sel(sel),
    .data_in(data_in),
    .data_out(data_out)
  );

  initial begin
    // Apply test vectors
    data_in = 16'b1010101010101010;

    sel = 4'b0000; #10;
    sel = 4'b0001; #10;
    sel = 4'b0010; #10;
    sel = 4'b0011; #10;
    sel = 4'b0100; #10;
    sel = 4'b0101; #10;
    sel = 4'b0110; #10;
    sel = 4'b0111; #10;
    sel = 4'b1000; #10;
    sel = 4'b1001; #10;
    sel = 4'b1010; #10;
    sel = 4'b1011; #10;
    sel = 4'b1100; #10;
    sel = 4'b1101; #10;
    sel = 4'b1110; #10;
    sel = 4'b1111; #10;

    // End the simulation
    $finish;
  end

  // Monitor the inputs and outputs
  initial begin
    $monitor("At time %t, sel = %b, data_in = %h, data_out = %b",
             $time, sel, data_in, data_out);
  end

endmodule
