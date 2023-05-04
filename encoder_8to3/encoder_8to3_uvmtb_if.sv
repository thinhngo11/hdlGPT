interface encoder_8to3_if(input logic clk);
    logic [7:0] data;
    logic [2:0] encoded_data;

    modport dut (input data, output encoded_data);
endinterface
