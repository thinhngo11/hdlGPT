module evenodd_vtb ()
  wire Y_tb;
  reg [3:0] X_tb;
  
  evenodd DUT (
    .Y(Y_tb),
    .A(X_tb[0]),
    .B(X_tb[1]),
    .C(X_tb[2]),
    .D(X_tb[3]));
  
  initial 
    begin
      #1 X_tb=4'b1111;
    end
  
  always
    begin
      if (X_tb>0)
        #5 X_tb=X_tb-1;
      else
        #5 X_tb=4'1111;
    end
endmodule
