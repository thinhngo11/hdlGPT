`timescale 1ns / 1ps

module traffic_light_controller_tb;

reg clk;
reg reset;
wire [1:0] north_south;
wire [1:0] east_west;

// Instantiate the traffic light controller
traffic_light_controller uut (
    .clk(clk),
    .reset(reset),
    .north_south(north_south),
    .east_west(east_west)
);

// Clock generation
always begin
    #5 clk = ~clk;
end

// Stimuli generation
initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Apply reset
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;

    // Run test for 200 time units
    #200;

    // Finish the simulation
    $finish;
end

// Monitor traffic light signals
initial begin
    $monitor("Time: %0dns | North_South: %2b | East_West: %2b", $time, north_south, east_west);
end

endmodule
