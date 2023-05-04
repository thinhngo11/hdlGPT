class loadable_shift_register_driver extends uvm_driver #(loadable_shift_register_item);
    `uvm_component_utils(loadable_shift_register_driver)

    virtual loadable_shift_register_if intf;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        loadable_shift_register_item item;

        fork
            // Drive reset
            while (1) begin
                @(posedge intf.clk);
                intf.reset <= seq_item_port.item.reset;
            end

            // Drive load, data_in, and shift_in signals
            while (1) begin
                seq_item_port.get_next_item(item);
                @(posedge intf.clk);
                intf.load <= item.load;
                intf.data_in <= item.data_in;
                intf.shift_in <= item.shift_in;
                seq_item_port.item_done();
            end
        join
    endtask
endclass
