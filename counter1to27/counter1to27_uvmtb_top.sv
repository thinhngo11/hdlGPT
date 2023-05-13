module top;
    wire clk;
    wire reset;
    wire [4:0] count;
    reg clk_gen;

    // Clock generation
    always begin
        #5 clk_gen = ~clk_gen;
    end

    // Instantiate the DUT
    counter_1_to_27 dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Instantiate the interface
    counter_if intf(.*);

    // Instantiate the test
    counter_test test;

    initial begin
        // Create and run the test
        test = new();
        uvm_config_db #(virtual counter_if)::set(null, "*", "vif", intf);
        run_test();
    end
endmodule
