// Define environment
class env extends uvm_env;
  `uvm_component_utils(env)

  agent agt;
  scoreboard sb;  
  virtual sequence_detector_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = agent::type_id::create("agt", this);
    sb = scoreboard::type_id::create("sb", this);    
  endfunction

  function void connect_phase(uvm_phase phase);
    agt.vif = vif;
    sb.exp.connect(agt.mon.ap);    
  endfunction
endclass
