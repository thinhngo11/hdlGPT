`include "fifo_pkg.sv"

module fifo_tb_top;
    import fifo_pkg::*;
    import uvm_pkg::*;

    wire clk;
    wire reset;
    wire wr_en;
    wire [7:0] wr_data;
    wire rd_en;
    wire [7:0] rd_data;
    wire empty;
    wire full;

    // Instantiate the DUT
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

    fifo_if vif (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .rd_en(rd_en),
        .rd_data(rd_data),
        .empty(empty),
        .full(full)
    );

    // Instantiate the SVAs
    fifo_sva sva_inst (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .rd_en(rd_en),
        .rd_data(rd_data),
        .empty(empty),
        .full(full)
    );
    initial begin
    uvm_config_db #(virtual fifo_if)::set(null, "*", "vif", vif);
    uvm_config_db #(virtual fifo_if)::set(null, "*.monitor", "vif", vif);
    run_test("fifo_test");
    end
endmodule
