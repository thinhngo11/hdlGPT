module traffic_light_controller_sva (
    input wire clk,
    input wire [1:0] north_south,
    input wire [1:0] east_west
);

  // Assert north_south and east_west are never both green
  always @(posedge clk) begin
    assert (north_south[1] !== 1'b1 || east_west[1] !== 1'b1);
  end

  // Assert north_south and east_west are never both red
  always @(posedge clk) begin
    assert (north_south[0] !== 1'b1 || east_west[0] !== 1'b1);
  end

  // Assert that a green signal is always followed by a red signal after one clock cycle
  always @(posedge clk) begin
    assert ($rose(north_south[1]) |-> $fell(north_south[1]) && $rose(north_south[0]));
    assert ($rose(east_west[1]) |-> $fell(east_west[1]) && $rose(east_west[0]));
  end
    
  // Cover north_south and east_west both being green (should never happen)
  cover property (@(posedge clk) disable iff (!clk) (north_south[1] === 1'b1 && east_west[1] === 1'b1));

  // Cover north_south and east_west both being red (should never happen)
  cover property (@(posedge clk) disable iff (!clk) (north_south[0] === 1'b1 && east_west[0] === 1'b1));

  // Cover all possible state transitions
  cover property (@(posedge clk) disable iff (!clk) ($rose(north_south[1]) && $fell(north_south[0]))); // NORTH -> EAST
  cover property (@(posedge clk) disable iff (!clk) ($rose(east_west[1]) && $fell(east_west[0]))); // EAST -> SOUTH
  cover property (@(posedge clk) disable iff (!clk) ($rose(north_south[0]) && $fell(north_south[1]))); // SOUTH -> WEST
  cover property (@(posedge clk) disable iff (!clk) ($rose(east_west[0]) && $fell(east_west[1]))); // WEST -> NORTH

endmodule
