// Define agent
class agent extends uvm_agent;
  `uvm_component_utils(agent)

  driver drv;
  monitor mon;
  virtual sequence_detector_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = driver::type_id::create("drv", this);
    mon = monitor::type_id::create("mon", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    drv.vif = vif;
    drv.seq_item_port.connect(sequencer.seq_item_export);
    mon.vif = vif;
  endfunction
endclass

// Define environment
class env extends uvm_env;
  `uvm_component_utils(env)

  agent agt;
  virtual sequence_detector_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = agent::type_id::create("agt", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    agt.vif = vif;
  endfunction
endclass
