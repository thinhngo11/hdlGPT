module evenodd (output Y, input A, B, C, D);
  assign Y = A ^ B ^ C ^ D;
endmodule
