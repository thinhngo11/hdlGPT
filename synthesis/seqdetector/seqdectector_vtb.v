`timescale 1ns / 1ps

module tb_sequence_detector_1011();

  reg clk;
  reg reset;
  reg data_in;
  wire detection;

  // Instantiate the sequence_detector_1011 module
  sequence_detector_1011 sequence_detector_inst (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .detection(detection)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    data_in = 0;

    // Apply reset
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;

    // Apply test data
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 1;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;

    // Finish simulation
    #10 $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("At time %t, data_in = %b, detection = %b", $time, data_in, detection);
  end

endmodule
