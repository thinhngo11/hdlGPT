class demux_seq_item extends uvm_sequence_item;
  rand bit [2:0] sel;
  rand bit data_in;
  bit [7:0] data_out;

  `uvm_object_utils_begin(demux_seq_item)
    `uvm_field_int(sel, UVM_DEFAULT)
    `uvm_field_int(data_in, UVM_DEFAULT)
    `uvm_field_int(data_out, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name = "demux_seq_item");
    super.new(name);
  endfunction

endclass
