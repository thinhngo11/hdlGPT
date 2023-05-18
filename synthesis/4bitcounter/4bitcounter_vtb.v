`timescale 1ns/1ps

module tb_loadable_up_down_counter();
    reg clk;
    reg reset;
    reg load;
    reg up_down;
    reg [3:0] load_data;
    wire [3:0] count;

    // Instantiate the loadable up/down counter
    loadable_up_down_counter dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .up_down(up_down),
        .load_data(load_data),
        .count(count)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Testbench stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        load = 0;
        up_down = 0;
        load_data = 4'b0000;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Load initial data
        load_data = 4'b0101;
        load = 1;
        #10 load = 0;

        // Test up counter
        up_down = 1;
        #50;

        // Test down counter
        up_down = 0;
        #50;

        // Load new data
        load_data = 4'b1100;
        load = 1;
        #10 load = 0;

        // Test up counter
        up_down = 1;
        #50;

        // Test down counter
        up_down = 0;
        #50;

        // Simulation done
        $finish;
    end

endmodule
