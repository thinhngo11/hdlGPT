class counter_env extends uvm_env;
    counter_agent agent;
    counter_scoreboard sb;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = counter_agent::type_id::create("agent", this);
        sb = counter_scoreboard::type_id::create("sb", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        sb.analysis_export.connect(agent.ap);
    endfunction
endclass
