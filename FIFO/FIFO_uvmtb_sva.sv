module fifo_sva (
    input wire clk,
    input wire reset,
    input wire wr_en,
    input wire [7:0] wr_data,
    input wire rd_en,
    input wire [7:0] rd_data,
    input wire empty,
    input wire full
);

    // No simultaneous write and read when FIFO is empty
    always @(posedge clk) begin
        if (empty) begin
            assert (!(wr_en && rd_en));
        end
    end

    // No write when FIFO is full
    always @(posedge clk) begin
        if (full) begin
            assert (!wr_en);
        end
    end

    // Data should not be read when FIFO is empty
    always @(posedge clk) begin
        if (empty && rd_en) begin
            assert (rd_data === 8'bxxxxxxxx);
        end
    end

    // Reset behavior
    always @(posedge clk) begin
        if (reset) begin
            assert (empty);
            assert (!full);
        end
    end

endmodule
