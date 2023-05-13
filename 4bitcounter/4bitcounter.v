module loadable_up_down_counter (
    input wire clk,
    input wire reset,
    input wire load, // 1 for load, 0 for count
    input wire up_down, // 1 for up, 0 for down
    input wire [3:0] load_data,
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000;
    end else begin
        if (load) begin
            count <= load_data;
        end else begin
            if (up_down) begin
                count <= count + 1;
            end else begin
                count <= count - 1;
            end
        end
    end
end

endmodule
