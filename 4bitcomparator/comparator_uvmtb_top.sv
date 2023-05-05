module mc_top;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    wire clk;
    logic [3:0] A, B;
    logic A_greater, A_equal, A_less;

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Instantiate design and interface
    magnitude_comparator_4bit uut (
        .A(A),
        .B(B),
        .A_greater(A_greater),
        .A_equal(A_equal),
        .A_less(A_less)
    );

    magnitude_comparator_if mc_if(clk);

    // Connect DUT and interface
    assign mc_if.A = A;
    assign mc_if.B = B;
    assign mc_if.A_greater = A_greater;
    assign mc_if.A_equal = A_equal;
    assign mc_if.A_less = A_less;

    // UVM test
    initial begin
        uvm_config_db #(virtual magnitude_comparator_if)::set(null, "uvm_test_top.env", "mc_if", mc_if);
        run_test("mc_test");
    end
endmodule
