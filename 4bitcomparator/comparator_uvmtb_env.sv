class mc_env extends uvm_env;
    `uvm_component_utils(mc_env)

    mc_agent agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = mc_agent::type_id::create("agent", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        agent.mc_if = mc_if;
    endfunction
endclass
