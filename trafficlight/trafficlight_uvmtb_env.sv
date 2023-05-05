import uvm_pkg::*;

class traffic_light_controller_env extends uvm_env;
  traffic_light_controller_agent agent;

  function new(string name = "traffic_light_controller_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = traffic_light_controller_agent::type_id::create("agent", this);
  endfunction : build_phase

endclass : traffic_light_controller_env
