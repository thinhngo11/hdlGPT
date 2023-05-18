module top;
    import uvm_pkg::*;
    import d_flip_flop_pkg::*;

    `include "uvm_macros.svh"
    `include "d_flip_flop_if.sv"

    // Design under test
    d_flip_flop dut ();
    // Clock
    logic clk;
    // Interface
    d_flip_flop_if dut_if (clk);

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Assign DUT ports to interface
        assign dut_if.D = dut.D;
        assign dut_if.RST = dut.RST;
        assign dut.Q = dut_if.Q;

        // Run the test
        run_test("d_flip_flop_test");
    end
endmodule
