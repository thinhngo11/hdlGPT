`timescale 1ns / 1ps

module tb_mux_16to1_sv;

  reg [3:0] sel;
  reg [15:0] data_in;
  wire data_out;

  // Instantiate the mux_16to1 module
  mux_16to1 mux_inst (
    .sel(sel),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Test scenario class
  class TestScenario;
    rand bit [3:0] sel;
    rand bit [15:0] data_in;
  endclass

  // Apply random test vectors and check the output
  task automatic apply_random_stimuli(int num_tests);
    TestScenario ts = new();
    repeat (num_tests) begin
      ts.randomize();
      sel <= ts.sel;
      data_in <= ts.data_in;
      #10;
      if (data_out !== data_in[ts.sel]) begin
        $error("Mismatch: sel = %0d, data_in = %h, data_out = %b", ts.sel, ts.data_in, data_out);
      end
    end
  endtask

  // Testbench control
  initial begin
    int num_tests = 100; // Number of random tests
    apply_random_stimuli(num_tests);

    // End the simulation
    $finish;
  end

  // Monitor the inputs and outputs
  initial begin
    $monitor("At time %t, sel = %b, data_in = %h, data_out = %b",
             $time, sel, data_in, data_out);
  end

endmodule
