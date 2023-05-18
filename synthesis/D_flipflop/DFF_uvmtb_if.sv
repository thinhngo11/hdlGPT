interface d_flip_flop_if(input logic clk);
    logic D;
    logic RST;
    logic Q;

    modport dut(input D, input RST, output Q);
endinterface
