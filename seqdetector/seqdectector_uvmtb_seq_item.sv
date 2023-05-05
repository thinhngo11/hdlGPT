`include "uvm_macros.svh"
import uvm_pkg::*;

// Define sequence item
class seq_item extends uvm_sequence_item;
  rand bit data_in;

  constraint c_data { data_in dist {0 := 50, 1:= 50}; }

  `uvm_object_utils(seq_item)

  function new (string name = "seq_item");
    super.new(name);
  endfunction
endclass
