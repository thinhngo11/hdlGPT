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

  // Define a class for random data generation
  class random_data_gen;
    rand bit data_in;

    // Constraint to limit the maximum number of consecutive 1's or 0's
    constraint c_data { data_in dist {0 := 50, 1:= 50}; }
  endclass

  // Test stimulus
  initial begin
    // Create and randomize data
    random_data_gen data_gen = new();
  
    // Initialize signals
    clk = 0;
    reset = 1;
    data_in = 0;

    // Apply reset
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;

    // Create and randomize data
    //random_data_gen data_gen = new();
    repeat (50) begin
      data_gen.randomize();
      data_in = data_gen.data_in;
      #10;
    end

    // Finish simulation
    #10 $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("At time %t, data_in = %b, detection = %b", $time, data_in, detection);
  end

endmodule
