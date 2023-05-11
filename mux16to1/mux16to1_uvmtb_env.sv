class mux_env extends uvm_env;

  mux_agent agent;
  mux_scoreboard scoreboard;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    agent = mux_agent::type_id::create("agent", this);
    scoreboard = mux_scoreboard::type_id::create("scoreboard", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    agent.monitor.ap.connect(scoreboard.exp);
  endfunction
endclass
