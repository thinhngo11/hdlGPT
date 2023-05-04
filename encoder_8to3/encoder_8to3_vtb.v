module encoder_8to3_tb;

reg [7:0] data;
wire [2:0] encoded_data;

// Instantiate the encoder_8to3 module
encoder_8to3 encoder_instance (
    .data(data),
    .encoded_data(encoded_data)
);

integer i;

initial begin
    // Test all valid 8-to-3 encoding combinations
    for(i = 0; i < 8; i = i + 1) begin
        data <= 1 << i;
        #10;
        $display("Input: %b, Encoded Data: %b", data, encoded_data);
    end

    // Test an invalid input
    data <= 8'hFF;
    #10;
    $display("Input: %b (Invalid), Encoded Data: %b", data, encoded_data);

    // Finish the simulation
    $finish;
end

endmodule
