module top;
    logic clk;
    loadable_shift_register_if intf(.clk(clk));

    // Instantiate DUT
    loadable_shift_register dut (
        .clk(clk),
        .reset(intf.reset),
        .load(intf.load),
        .data_in(intf.data_in),
        .shift_in(intf.shift_in),
        .data_out(intf.data_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initialize UVM
        uvm_config_db#(virtual loadable_shift_register_if)::set(null, "*", "virtual_intf", intf);
        run_test("loadable_shift_register_test");
    end
endmodule
