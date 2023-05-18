`timescale 1ns / 1ps

module tb_decoder_4to16();

    // Declarations
    reg [3:0] sel;
    wire [15:0] out;

    // Instantiate the decoder module
    decoder_4to16 decoder(
        .sel(sel),
        .out(out)
    );

    // Testbench stimulus
    initial begin
        // Set up the file to log the results
        string log_file = "decoder_4to16_random_results.log";
        int file_handle = $fopen(log_file, "w");

        // Random number generator
        int unsigned seed = $urandom_range(1, 2**32-1);
        $srandom(seed);

        // Number of random test cases
        int num_tests = 100;

        // Test with random input values
        for (int i = 0; i < num_tests; i++) begin
            sel = $urandom_range(0, 15);
            #10; // Wait 10 time units before changing the input

            // Log the results
            $fwrite(file_handle, "At time %0t, sel = %0b, out = %0b\n", $time, sel, out);
        end

        // Close the log file and finish the simulation
        $fclose(file_handle);
        $finish;
    end

    // Assertion-based checks
    always @(posedge out) begin
        assert(out === 1 << sel) else $error("Mismatch: sel = %0b, out = %0b", sel, out);
    end

endmodule
