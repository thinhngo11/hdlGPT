module encoder_8to3_tb;

reg [7:0] data;
wire [2:0] encoded_data;

// Instantiate the encoder_8to3 module
encoder_8to3 encoder_instance (
    .data(data),
    .encoded_data(encoded_data)
);

integer i, seed;
int unsigned rand_index;

initial begin
    // Set the random seed
    seed = $time;
    $srandom(seed);

    // Run random test cases
    for(i = 0; i < 100; i = i + 1) begin
        // Generate a single bit high at a random index
        rand_index = $urandom_range(0, 7);
        data <= (1 << rand_index);
        #10;
        $display("Input: %b, Encoded Data: %b", data, encoded_data);
    end

    // Finish the simulation
    $finish;
end

endmodule
