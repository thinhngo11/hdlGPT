module JD (S, En, Y);
parameter N = 3;
input [0:N-1] S;
input En;
output [0:2*N-1] Y;
reg [0:2*N-1] Y;

reg [0:2*N-1] Address;
integer Jr;

always @(S or En)
  if (En == 'b1)
  begin
    Address = 0;

    for (J=0; j<N; J=J+1)
      if (S[J})
        Address = Address + 1;
    
    if (S[0])
        Address = 2*N - Address;

    Y ='b0;
    Y[Address] = 'b1;
  end
  else if (En == 'b0)
    Y = 'b0;
  else
    Y ='bx;
endmodule
