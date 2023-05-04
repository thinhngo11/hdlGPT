class loadable_shift_register_monitor extends uvm_monitor;
    `uvm_component_utils(loadable_shift_register_monitor)

    virtual loadable_shift_register_if intf;
    uvm_analysis_port #(loadable_shift_register_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        loadable_shift_register_item item;

        item = loadable_shift_register_item::type_id::create("item");

        forever begin
            @(posedge intf.clk);
            item.reset = intf.reset;
            item.load = intf.load;
            item.data_in = intf.data_in;
            item.shift_in = intf.shift_in;
            item.data_out = intf.data_out;
            ap.write(item);
        end
    endtask
endclass
