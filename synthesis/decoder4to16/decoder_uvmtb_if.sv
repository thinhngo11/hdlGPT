interface decoder_4to16_if(input logic clk);
    logic [3:0] sel;
    logic [15:0] out;

    modport decoder_mp(input sel, output out);
    modport tb_mp(input out, output sel);

endinterface
