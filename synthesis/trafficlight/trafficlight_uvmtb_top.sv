import uvm_pkg::*;
`include "uvm_macros.svh"

module traffic_light_controller_tb;
  reg clk;
  wire reset;
  wire [1:0] north_south;
  wire [1:0] east_west;

  traffic_light_controller_if intf(.clk(clk));

  // Instantiate the 4-way traffic light controller
  traffic_light_controller uut (
    .clk(clk),
    .reset(reset),
    .north_south(north_south),
    .east_west(east_west)
  );

  // Instantiate the SVA module
  traffic_light_controller_sva sva (
    .clk(clk),
    .north_south(north_south),
    .east_west(east_west)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  initial begin
    // Initialize signals
    clk = 0;
    intf.reset = 1;

    // Run the UVM test
    uvm_config_db#(virtual traffic_light_controller_if)::set(null, "uvm_test_top.env.agent", "intf", intf);
    run_test("traffic_light_controller_test");
  end

endmodule
