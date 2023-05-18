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

// Class for random reset generation
class ResetGenerator;
    rand bit reset;
    rand int unsigned duration;

    constraint reset_duration_c { duration inside {[5:15]}; }

    function void display_reset();
        $display("Reset: %0d, Duration: %0d", reset, duration);
    endfunction
endclass

ResetGenerator reset_gen = new();

// Stimuli generation
initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Run test for 200 time units
    for (int i = 0; i < 5; i++) begin
        reset_gen.randomize();
        reset_gen.display_reset();
        reset <= reset_gen.reset;
        #reset_gen.duration;
    end

    // Finish the simulation
    $finish;
end

// Monitor traffic light signals
initial begin
    $monitor("Time: %0dns | North_South: %2b | East_West: %2b", $time, north_south, east_west);
end

endmodule
