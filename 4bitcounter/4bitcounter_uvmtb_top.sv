module top;
    // Signals
    logic clk;
    logic reset;
    logic load;
    logic up_down;
    logic [3:0] load_data;
    logic [3:0] count;

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // DUT
    loadable_up_down_counter dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .up_down(up_down),
        .load_data(load_data),
        .count(count)
    );

    // Interface
    loadable_up_down_counter_if intf(clk);

    // UVM test
    initial begin
        uvm_config_db #(virtual loadable_up_down_counter_if)::set(null, "*", "vif", intf);
        run_test("counter_test");
    end

    // Assign interface signals
    assign intf.reset = reset;
    assign intf.load = load;
    assign intf.up_down = up_down;
    assign intf.load_data = load_data;
    assign intf.count = count;
endmodule
