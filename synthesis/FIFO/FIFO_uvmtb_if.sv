interface fifo_if (
    input wire clk,
    input wire reset,
    input wire wr_en,
    input wire [7:0] wr_data,
    input wire rd_en,
    output wire [7:0] rd_data,
    output wire empty,
    output wire full
);

    modport DUT (
        input clk, reset, wr_en, wr_data, rd_en,
        output rd_data, empty, full
    );

    modport driver (
        input clk,
        output reset, wr_en, wr_data, rd_en
    );

    modport monitor (
        input clk, reset, wr_en, wr_data, rd_en, rd_data, empty, full
    );

endinterface
