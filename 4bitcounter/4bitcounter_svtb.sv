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

        // Random seed
        int unsigned seed = $urandom;

        // Run random test
        repeat (100) begin
            // Generate random inputs
            load = $urandom_range(0, 1);
            up_down = $urandom_range(0, 1);
            load_data = $urandom_range(0, 15);

            // Apply random inputs
            #10;
        end

        // Simulation done
        $finish;
    end

endmodule
