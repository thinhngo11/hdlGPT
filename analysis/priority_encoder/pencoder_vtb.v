module pencoder_vtb (
  wire [2:0] Y_tb;
  reg [7:0] X_tb;
  reg En_tb;
  
  pencoder DUT (.Y(Y_tb),
                .X(X_tb),
                .En(En));
  
  initial
    begin
      En_tb=1'b0; X_tb=8'b00000000;
      #5;
      En_tb=1'b1; X_tb=8'b00000000;
       #5;
      En_tb=1'b1; X_tb=8'b00000001;
       #5;
      En_tb=1'b1; X_tb=8'b00000010;
       #5;
      En_tb=1'b1; X_tb=8'b00000100;
       #5;
      En_tb=1'b1; X_tb=8'b00001000;
       #5;
      En_tb=1'b1; X_tb=8'b00010000;
       #5;
      En_tb=1'b1; X_tb=8'b00100000;
       #5;
      En_tb=1'b1; X_tb=8'b01000000;
       #5;
      En_tb=1'b1; X_tb=8'b10000000;
       #5;
      En_tb=1'b1; X_tb=8'b01001000;
    end
  endmodule
