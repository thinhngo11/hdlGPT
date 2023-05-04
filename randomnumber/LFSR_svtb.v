`timescale 1ns/1ps

module tb_lfsr8bit_rng();
    bit clk;
    bit rst;
    logic [7:0] random_number;

    // Instantiate the lfsr8bit_rng module
    lfsr8bit_rng uut (
        .clk(clk),
        .rst(rst),
        .random_number(random_number)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Stimulus and monitoring
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;

        // Apply random resets
        repeat (10) begin
            rst = $urandom_range(0, 1);
            #10;
        end
        rst = 0; // Release reset

        // Monitor the random number output
        always @(posedge clk) begin
            $display("Time: %t, Random number: %02h", $time, random_number);
        end

        // Run the simulation for 1000 time units
        #1000;
        $finish;
    end

endmodule
