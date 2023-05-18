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

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Test the counter
        repeat(60) begin
            #10; // Wait for 10 time units
            $display("Time: %t, Count: %d", $time, count);
        end

        // Finish the simulation
        $finish;
    end
endmodule
