// NoBIT = (1, 7)
module ABC #(parameter NOBIT = 3) (
    input wire clk,
    input wire reset,
    input wire ld,
    input wire [7:0] din,
    input wire [NOBIT-1:0] sin,
    input wire lnr,
    output reg [7:0] dout
);

reg [7:0] _reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        _reg <= 8'b0;
    end
    else begin
      if (ld) begin
            _reg <= din;
      end
      else if (lnr) begin
        _reg <= {_reg[7-NOBIT:0], sin};
        end
      else begin
        _reg <= {sin, _reg[7:NOBIT]};
      end
    end
end

assign dout = _reg;

endmodule
