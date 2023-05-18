import uvm_pkg::*;

class traffic_light_controller_base_sequence extends uvm_sequence#(traffic_light_controller_seq_item);

  function new(string name = "");
    super.new(name);
  endfunction : new

endclass : traffic_light_controller_base_sequence
```

`traffic_light_controller_random_sequence.sv`
```systemverilog
import uvm_pkg::*;

class traffic_light_controller_random_sequence extends traffic_light_controller_base_sequence;

  function new(string name = "");
    super.new(name);
  endfunction : new

  virtual task body();
    repeat (5) begin
      traffic_light_controller_seq_item item = new();
      item.randomize();
      item.display();
      start_item(item);
      finish_item(item);
    end
  endtask : body

endclass : traffic_light_controller_random_sequence
