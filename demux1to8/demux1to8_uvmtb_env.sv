class demux_env extends uvm_env;
  demux_agent agent;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = demux_agent::type_id::create("agent", this);
  endfunction

endclas
