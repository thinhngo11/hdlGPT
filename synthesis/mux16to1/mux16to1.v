module mux_16to1 (
    input wire [3:0] sel,
    input wire [15:0] data_in,
    output wire data_out
);

  assign data_out = (sel == 4'b0000) ? data_in[0]  :
                    (sel == 4'b0001) ? data_in[1]  :
                    (sel == 4'b0010) ? data_in[2]  :
                    (sel == 4'b0011) ? data_in[3]  :
                    (sel == 4'b0100) ? data_in[4]  :
                    (sel == 4'b0101) ? data_in[5]  :
                    (sel == 4'b0110) ? data_in[6]  :
                    (sel == 4'b0111) ? data_in[7]  :
                    (sel == 4'b1000) ? data_in[8]  :
                    (sel == 4'b1001) ? data_in[9]  :
                    (sel == 4'b1010) ? data_in[10] :
                    (sel == 4'b1011) ? data_in[11] :
                    (sel == 4'b1100) ? data_in[12] :
                    (sel == 4'b1101) ? data_in[13] :
                    (sel == 4'b1110) ? data_in[14] :
                                      data_in[15];

endmodule
