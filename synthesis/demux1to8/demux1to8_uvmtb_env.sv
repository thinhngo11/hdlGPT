class demux_env extends uvm_env;
  demux_agent agent;
  demux_scoreboard scoreboard;
  demux_coverage_collector coverage_collector;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = demux_agent::type_id::create("agent", this);
    scoreboard = demux_scoreboard::type_id::create("scoreboard", this);
    coverage_collector = demux_coverage_collector::type_id::create("coverage_collector", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    scoreboard.exp.connect(agent.ap);
    coverage_collector.ap.connect(agent.ap);
  endfunction

endclass
