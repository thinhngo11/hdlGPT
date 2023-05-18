class counter_env extends uvm_env;
    counter_agent agent;
    counter_scoreboard sb;
    counter_coverage_collector cov_col;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = counter_agent::type_id::create("agent", this);
        sb = counter_scoreboard::type_id::create("sb", this);
        cov_col = counter_coverage_collector::type_id::create("cov_col", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        sb.analysis_export.connect(agent.ap);
        cov_col.analysis_export.connect(agent.ap);
    endfunction
    
    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        cov_col.report_coverage();
    endfunction
endclass
