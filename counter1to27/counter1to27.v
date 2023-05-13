module counter_1_to_27 (
    input clk,
    input reset,
    output reg [4:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 5'b00001; // Initialize the counter to 1
    end else begin
        if (count == 5'b11011) begin // Check if the count is 27
            count <= 5'b00001; // Reset the counter to 1
        end else begin
            count <= count + 1'b1; // Increment the counter
        end
    end
end

endmodule
