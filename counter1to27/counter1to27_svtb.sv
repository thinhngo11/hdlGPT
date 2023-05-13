`timescale 1ns / 1ps

module tb_counter_1_to_27();
    reg clk;
    reg reset;
    wire [4:0] count;

    // Instantiate the counter_1_to_27 module
    counter_1_to_27 counter_inst (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;

        // Randomize reset
        class ResetRandomizer;
            rand bit reset;
            constraint reset_c { reset == 0 || reset == 1; }
        endclass

        ResetRandomizer r_rand = new();
        
        repeat(60) begin
            // Randomize reset signal
            if (!r_rand.randomize()) $error("Randomization failed");
            reset = r_rand.reset;

            #10; // Wait for 10 time units
            $display("Time: %t, Reset: %b, Count: %d", $time, reset, count);
        end

        // Finish the simulation
        $finish;
    end
endmodule
