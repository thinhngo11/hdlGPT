class loadable_shift_register_env extends uvm_env;
    `uvm_component_utils(loadable_shift_register_env)

    loadable_shift_register_agent agent;
    loadable_shift_register_scoreboard scoreboard;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = loadable_shift_register_agent::type_id::create("agent", this);
        scoreboard = loadable_shift_register_scoreboard::type_id::create("scoreboard", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.virtual_intf = this.get_virtual_interface();
        scoreboard.analysis_export.connect(agent.monitor.ap);        
    endfunction
endclass
