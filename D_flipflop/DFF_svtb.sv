`timescale 1ns/1ps

module d_flip_flop_tb;

reg D;
reg CLK;
reg RST;
wire Q;
integer i, seed;

// Instantiate the D flip-flop module
d_flip_flop dff (
    .D(D),
    .CLK(CLK),
    .RST(RST),
    .Q(Q)
);

// Clock generation
always begin
    #5 CLK = ~CLK;
end

// Stimuli generation for testing
initial begin
    // Initialize signals
    CLK = 1'b0;
    RST = 1'b0;
    D = 1'b0;

    // Set the random seed
    seed = $time;
    $srandom(seed);

    // Test reset
    RST <= 1'b1;
    #10 RST <= 1'b0;

    // Run random test cases
    for (i = 0; i < 50; i = i + 1) begin
        D <= $urandom_range(0, 1);
        #10;
    end

    // Finish the simulation
    $finish;
end

// Monitor for observing outputs
initial begin
    $monitor("At time %0dns: D=%b, CLK=%b, RST=%b, Q=%b",
             $time, D, CLK, RST, Q);
end

endmodule
