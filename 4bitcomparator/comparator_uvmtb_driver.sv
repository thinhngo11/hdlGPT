class mc_driver extends uvm_driver #(mc_seq_item);
    `uvm_component_utils(mc_driver)

    virtual magnitude_comparator_if mc_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        mc_seq_item req;
        forever begin
            seq_item_port.get_next_item(req);
            mc_if.A <= req.A;
            mc_if.B <= req.B;
            @(posedge mc_if.clk);
            seq_item_port.item_done();
        end
    endtask
endclass
