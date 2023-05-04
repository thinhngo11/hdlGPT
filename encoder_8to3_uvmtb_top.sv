module top;
    import uvm_pkg::*;
    import encoder_8to3_pkg::*;

    `include "uvm_macros.svh"
    `include "encoder_8to3_if.sv"

    // Design under test
    encoder_8to3 dut ();
    // Clock
    logic clk;
    // Interface
    encoder_8to3_if dut_if (clk);

    // Instantiate the assertions module
    encoder_8to3_assertions assertions (
        .data(dut_if.data),
        .encoded_data(dut_if.encoded_data),
        .clk(clk)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Assign DUT ports to interface
        assign dut_if.data = dut.data;
        assign dut.encoded_data = dut_if.encoded_data;

        // Run the test
        run_test("encoder_8to3_test");
    end
endmodule
