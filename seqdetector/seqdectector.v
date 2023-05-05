module sequence_detector_1011 (
    input wire clk,
    input wire reset,
    input wire data_in,
    output reg detection
);

  reg [1:0] current_state, next_state;

  // Define FSM states
  localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

  // State transition logic
  always @(*) begin
    case (current_state)
      S0: next_state = (data_in == 1'b1) ? S1 : S0;
      S1: next_state = (data_in == 1'b0) ? S2 : S1;
      S2: next_state = (data_in == 1'b1) ? S3 : S0;
      S3: next_state = (data_in == 1'b1) ? S1 : S0;
      default: next_state = S0;
    endcase
  end

  // State register
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      current_state <= S0;
      detection <= 1'b0;
    end else begin
      current_state <= next_state;
      detection <= (current_state == S3) & (data_in == 1'b1);
    end
  end

endmodule
