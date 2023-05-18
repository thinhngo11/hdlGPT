module top;
    import uvm_pkg::*;

    // Interface
    logic clk;
    decoder_4to16_if intf(clk);

    // Design
    decoder_4to16 dut (
        .sel(intf.sel),
        .out(intf.out)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    // Testbench
    initial begin
        // Set the interface
        if (!uvm_config_db#(virtual decoder_4to16_if.tb_mp)::set(null, "*", "vif", intf.tb_mp))
            `uvm_fatal("SETVIF", "Unable to set virtual interface for decoder_4to16_if!")

        // Run the UVM test
        run_test("decoder_4to16_test");
    end

endmodule
