interface counter_if(input logic clk);
    logic reset;
    logic [4:0] count;

    clocking cb @(posedge clk);
        output reset;
        input count;
    endclocking

    modport dut_mp(clocking cb);

    // SVA properties
    property p_reset_count;
        @(posedge clk) disable iff (!reset) (reset |-> count == 1);
    endproperty

    property p_increment_count;
        @(posedge clk) disable iff (!reset) (!reset |-> count == ($past(count) == 27 ? 1 : $past(count) + 1));
    endproperty

    // Assertions
    assert property (p_reset_count) else `uvm_error("SVA", "Reset assertion failed")
    assert property (p_increment_count) else `uvm_error("SVA", "Increment assertion failed")
endinterface
