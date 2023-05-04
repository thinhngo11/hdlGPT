class d_flip_flop_env extends uvm_env;
    `uvm_component_utils(d_flip_flop_env)

    d_flip_flop_agent agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = d_flip_flop_agent::type_id::create("agent", this);
    endfunction
endclass
