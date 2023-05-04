module fifo (
    input wire clk,
    input wire reset,
    input wire wr_en,
    input wire [7:0] wr_data,
    input wire rd_en,
    output reg [7:0] rd_data,
    output reg empty,
    output reg full
);

    parameter DEPTH = 16;
    reg [7:0] memory [0:DEPTH-1];
    reg [4:0] wr_ptr = 0;
    reg [4:0] rd_ptr = 0;
    reg [4:0] count = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count <= 0;
            empty <= 1;
            full <= 0;
        end else begin
            if (wr_en && !full) begin
                memory[wr_ptr] <= wr_data;
                wr_ptr <= wr_ptr + 1;
                count <= count + 1;
            end

            if (rd_en && !empty) begin
                rd_data <= memory[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                count <= count - 1;
            end

            empty <= (count == 0);
            full <= (count == DEPTH);
        end
    end

endmodule
