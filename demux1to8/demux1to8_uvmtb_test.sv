class demux_base_test extends uvm_test;
  demux_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = demux_env::type_id::create("env", this);
  endfunction

  function void run_phase(uvm_phase phase);
    demux_base_sequence seq;

    seq = demux_base_sequence::type_id::create("seq");
    fork
      seq.start(env.agent.sequencer);
    join
  endfunction

endclass
