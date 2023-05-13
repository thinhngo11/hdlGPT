class counter_env extends uvm_env;
    counter_agent agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = counter_agent::type_id::create("agent", this);
    endfunction
endclass
