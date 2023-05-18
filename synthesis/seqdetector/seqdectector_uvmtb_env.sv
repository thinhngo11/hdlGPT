// Define environment
class env extends uvm_env;
  `uvm_component_utils(env)

  agent agt;
  scoreboard sb;  
  coverage cov;
  
  virtual sequence_detector_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = agent::type_id::create("agt", this);
    sb = scoreboard::type_id::create("sb", this);    
    cov = coverage::type_id::create("cov", this);    
  endfunction

  function void connect_phase(uvm_phase phase);
    agt.vif = vif;
    sb.exp.connect(agt.mon.ap);    
    agt.mon.ap.connect(cov.analysis_export);    
  endfunction
endclass
