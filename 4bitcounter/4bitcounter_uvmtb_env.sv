class counter_env extends uvm_env;
    // Components
    counter_agent agent;
    counter_scoreboard scoreboard;

    // Constructor
    function new(string name = "counter_env", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        agent = counter_agent::type_id::create("agent", this);
        scoreboard = counter_scoreboard::type_id::create("scoreboard", this);
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        agent.ap.connect(scoreboard.analysis_export);
    endfunction
endclass
