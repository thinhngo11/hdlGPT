import uvm_pkg::*;

class traffic_light_controller_agent extends uvm_agent;

  traffic_light_controller_if intf;

  function new(string name = "traffic_light_controller_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual traffic_light_controller_if)::get(this, "", "intf", intf))
      `uvm_fatal(get_type_name(), "Failed to get traffic_light_controller_if from config_db")
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    fork
      apply_reset();
    join_none
  endtask : run_phase

  virtual task apply_reset();
    forever begin
      #10 intf.reset <= 1'b1;
      #20 intf.reset <= 1'b0;
    end
  endtask : apply_reset

endclass : traffic_light_controller_agent
