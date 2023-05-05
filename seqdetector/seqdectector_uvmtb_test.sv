// Define test
class test extends uvm_test;
  `uvm_component_utils(test)

  env my_env;
  virtual sequence_detector_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(virtual sequence_detector_if)::set(this, "*", "vif", vif);
    my_env = env::type_id::create("my_env", this);
  endfunction
  
  function void run_phase(uvm_phase phase);
    seq_1011 main_seq = new("main_seq");
    main_seq.start(agt.sequencer);
  endfunction
endclass
