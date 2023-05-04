class demux_base_test extends uvm_test;
  demux_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = demux_env::type_id::create("env", this);
  endfunction

endclass
