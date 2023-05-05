import uvm_pkg::*;

class traffic_light_controller_test extends uvm_test;
  traffic_light_controller_env env;

  function new(string name = "traffic_light_controller_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = traffic_light_controller_env::type_id::create("env", this);
  endfunction : build_phase

endclass : traffic_light_controller_test
