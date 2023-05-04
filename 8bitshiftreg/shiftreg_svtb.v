`timescale 1ns/1ps

module tb_loadable_shift_register();

    reg clk;
    reg reset;
    reg load;
    reg [7:0] data_in;
    reg shift_in;
    wire [7:0] data_out;

    // Instantiate the loadable_shift_register module
    loadable_shift_register loadable_shift_register_inst (
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .shift_in(shift_in),
        .data_out(data_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Random generator class
    class RandGen;
        rand bit load;
        rand bit [7:0] data_in;
        rand bit shift_in;

        // Constraint to limit the number of shifts
        constraint c_shift { shift_in inside {0, 1}; }
    endclass

    RandGen rand_gen;

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        load = 0;
        data_in = 8'b0;
        shift_in = 0;

        // Initialize random generator
        rand_gen = new();
        if (!rand_gen.randomize()) $fatal("Randomization failed!");

        // Apply reset
        reset = 1;
        #10 reset = 0;

        repeat (20) begin
            if (!rand_gen.randomize()) $fatal("Randomization failed!");

            // Load data
            data_in = rand_gen.data_in;
            load = rand_gen.load;
            #10 load = 0;

            // Shift right
            shift_in = rand_gen.shift_in;
            repeat (8) begin
                #10;
            end
        end

        // End simulation
        $finish;
    end

endmodule
