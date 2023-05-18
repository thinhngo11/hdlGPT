import uvm_pkg::*;

class traffic_light_controller_seq_item extends uvm_sequence_item;
  rand bit reset;
  rand int unsigned duration;

  constraint duration_c { duration inside {[5:15]}; }

  function new(string name = "");
    super.new(name);
  endfunction : new

  function void display();
    $display("Reset: %0d, Duration: %0d", reset, duration);
  endfunction

endclass : traffic_light_controller_seq_item
