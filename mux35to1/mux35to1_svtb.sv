module mux_35_1_tb();

  logic [34:0] data_in;
  logic [5:0] sel;
  logic out;

  mux_35_1 dut(
    .data_in(data_in),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: select the 17th input
    data_in = 35'b00000000000000000000000000000000010000;
    sel = 6'b001000;
    #10;
    if (out !== 1'b1) $display("Test case 1 failed: expected 1, got %b", out);

    // Test case 2: select the 35th input
    data_in = 35'b10000000000000000000000000000000000000;
    sel = 6'b100000;
    #10;
    if (out !== 1'b1) $display("Test case 2 failed: expected 1, got %b", out);

    // Test case 3: select an invalid input
    data_in = 35'b00000000000000000000000000000000000000;
    sel = 6'b111111;
    #10;
    if (out !== 1'b0) $display("Test case 3 failed: expected 0, got %b", out);

    $finish;
  end

endmodule
