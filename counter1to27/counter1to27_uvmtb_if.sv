interface counter_if(input logic clk);
    logic reset;
    logic [4:0] count;

    clocking cb @(posedge clk);
        output reset;
        input count;
    endclocking

    modport dut_mp(clocking cb);
endinterface
