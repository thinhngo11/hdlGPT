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

endmodule
