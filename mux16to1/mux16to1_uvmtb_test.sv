class mux_test extends uvm_test;

  mux_env env;
  uvm_config_db #(mux_if) cfg;

  function new(string name = "mux_test");
    super.new(name);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    env = mux_env::type_id::create("env", this);
  endfunction

  virtual task main_phase(uvm_phase phase);
    mux_sequence seq = new("seq");
    uvm_config_db #(uvm_object_wrapper)::set(this, "env.agent.sequencer.main_phase", "default_sequence", seq.get_type());
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);
    phase.drop_objection(this);
  endtask
endclass
