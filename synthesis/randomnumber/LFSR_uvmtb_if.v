interface rng_if(input logic clk);
    logic rst;
    logic [7:0] random_number;

    modport dut_mp (input rst, output random_number);

endinterface
