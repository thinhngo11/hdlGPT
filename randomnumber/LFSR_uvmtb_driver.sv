class rng_driver extends uvm_driver#(rng_seq_item);
    `uvm_component_utils(rng_driver)

    rng_if rng_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        uvm_config_db#(rng_if)::get(this, "", "rng_if", rng_if);
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            rng_if.rst <= req.rst;
            #10;
            seq_item_port.item_done();
        end
    endtask
endclass
