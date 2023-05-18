`timescale 1ns/1ps

module fifo_tb;
    reg clk;
    reg reset;
    reg wr_en;
    reg [7:0] wr_data;
    reg rd_en;
    wire [7:0] rd_data;
    wire empty;
    wire full;

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

        // Write data into the FIFO
        repeat (10) begin
            #10;
            wr_en = 1;
            wr_data = $random;
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
