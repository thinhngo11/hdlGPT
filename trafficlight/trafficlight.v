module traffic_light_controller (
    input wire clk,
    input wire reset,
    output reg [1:0] north_south,
    output reg [1:0] east_west
);

// States
typedef enum {NORTH=2'b00, EAST=2'b01, SOUTH=2'b10, WEST=2'b11} state_t;

// Current and next state registers
reg [1:0] current_state, next_state;

// Update state on a clock edge
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= NORTH;
    end else begin
        current_state <= next_state;
    end
end

// State transition logic
always @(*) begin
    case (current_state)
        NORTH: next_state = EAST;
        EAST: next_state = SOUTH;
        SOUTH: next_state = WEST;
        WEST: next_state = NORTH;
        default: next_state = NORTH;
    endcase
end

// Output logic
assign north_south = (current_state == NORTH || current_state == SOUTH) ? 2'b10 : 2'b01;
assign east_west = (current_state == EAST || current_state == WEST) ? 2'b10 : 2'b01;

endmodule
