class demux_env extends uvm_env;
  demux_agent agent;
  demux_scoreboard scoreboard;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = demux_agent::type_id::create("agent", this);
    scoreboard = demux_scoreboard::type_id::create("scoreboard", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    scoreboard.exp.connect(agent.ap);
  endfunction

endclass
