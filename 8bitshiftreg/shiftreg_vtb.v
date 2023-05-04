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

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        load = 0;
        data_in = 8'b0;
        shift_in = 0;

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Load data
        data_in = 8'b10101010;
        load = 1;
        #10 load = 0;

        // Shift right
        shift_in = 1;
        repeat (8) begin
            #10;
        end

        // Load new data
        data_in = 8'b11001100;
        load = 1;
        #10 load = 0;

        // Shift right
        shift_in = 0;
        repeat (4) begin
            #10;
        end

        // End simulation
        $finish;
    end

endmodule
