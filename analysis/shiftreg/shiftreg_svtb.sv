`timescale 1ns/1ps
module ABCtb();
    parameter NOBIT = 2;

    reg clk;
    reg reset;
    reg ld;
    reg [7:0] din;
    reg [NOBIT-1:0] sin;
    reg lnr;
    wire [7:0] dout;

    // Instantiate the loadable_shift_register module
  ABC #(.NOBIT(NOBIT)) dut (
        .clk(clk),
        .reset(reset),
        .ld(ld),
        .din(din),
        .sin(sin),
        .lnr(lnr),
        .dout(dout)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Random generator class
    class RandGen;
        rand bit ld;
        rand bit [7:0] din;
        rand bit [NOBIT-1:0] sin;
        rand bit lnr;

        // Constraint to limit the number of shifts
      //constraint c { ld inside {0, 255}; }
    endclass

    RandGen rand_gen;

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        ld = 0;
        din = 8'b0;
        sin = 0;
        lnr = 0;        

        // Initialize random generator
        rand_gen = new();
        if (!rand_gen.randomize()) $fatal("Randomization failed!");

        // Apply reset
        reset = 1;
        #10 reset = 0;

        repeat (20) begin
            if (!rand_gen.randomize()) $fatal("Randomization failed!");

            // Load data
            din = rand_gen.din;
            ld = rand_gen.ld;
            lnr = rand_gen.lnr;
            sin = rand_gen.sin;
            //#10 ld = 0;
          
            repeat (8) begin
                #10;
            end
        end

        // End simulation
        $finish;
    end

  // Monitor outputs
  initial begin
    $monitor("At time %t, reset = %b, din = %b, ld = %b, sin = %b, NOBIT = %b, lnr = %b dout = %b", $time, reset, din, ld, sin, NOBIT, lnr, dout);
  end

endmodule
