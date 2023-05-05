interface traffic_light_controller_if(input wire clk);
  logic reset;
  logic [1:0] north_south;
  logic [1:0] east_west;
endinterface
