`include "uvm_macros.svh"

// Add the following class
class traffic_light_controller_driver extends uvm_driver#(traffic_light_controller_seq_item);
  virtual traffic_light_controller_if intf;

  function new(string name = "traffic_light_controller_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual task run_phase(uvm_phase phase);
    traffic_light_controller_seq_item item;
    while (1) begin
      seq_item_port.get_next_item(item);
      #item.duration intf.reset <= item.reset;
      seq_item_port.item_done();
    end
  endtask : run_phase

endclass : traffic_light_controller_driver
