`timescale 1ns/1ps

module fifo_tb;
    logic clk;
    logic reset;
    logic wr_en;
    logic [7:0] wr_data;
    logic rd_en;
    logic [7:0] rd_data;
    logic empty;
    logic full;

    // Instantiate the FIFO module
    fifo fifo_inst (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .rd_en(rd_en),
        .rd_data(rd_data),
        .empty(empty),
        .full(full)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Class for random data generation
    class fifo_sequence;
        rand bit [7:0] data;

        // Randomize with constraints
        constraint data_c { data > 0; }
    endclass

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        wr_en = 0;
        wr_data = 0;
        rd_en = 0;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;

        fifo_sequence seq = new();

        // Write data into the FIFO
        repeat (10) begin
            #10;
            if (seq.randomize()) begin
                wr_en = 1;
                wr_data = seq.data;
            end
            #10;
            wr_en = 0;
        end

        // Read data from the FIFO
        repeat (10) begin
            #10;
            rd_en = 1;
            #10;
            rd_en = 0;
        end

        // Finish the simulation
        #10 $finish;
    end
endmodule
