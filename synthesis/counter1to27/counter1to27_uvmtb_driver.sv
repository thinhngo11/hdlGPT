class counter_driver extends uvm_driver #(counter_seq_item);
    virtual interface counter_if intf;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            intf.reset <= req.reset;
            seq_item_port.item_done();
        end
    endtask
endclass
