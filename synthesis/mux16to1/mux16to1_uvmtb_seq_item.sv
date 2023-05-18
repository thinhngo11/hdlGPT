class mux_transaction extends uvm_sequence_item;
  rand bit [3:0] sel;
  rand bit [15:0] data_in;
  bit data_out;

  `uvm_object_utils(mux_transaction)

  function new(string name = "mux_transaction");
    super.new(name);
  endfunction

  function void do_copy(uvm_object rhs);
    mux_transaction tr = mux_transaction(rhs);
    sel = tr.sel;
    data_in = tr.data_in;
    data_out = tr.data_out;
  endfunction

  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    mux_transaction tr = mux_transaction(rhs);
    return (sel == tr.sel) && (data_in == tr.data_in) && (data_out == tr.data_out);
  endfunction

  function void do_pack(uvm_packer packer);
    packer.pack_field_int(sel, 4);
    packer.pack_field_int(data_in, 16);
    packer.pack_field_int(data_out, 1);
  endfunction

  function void do_unpack(uvm_packer packer);
    packer.unpack_field_int(sel, 4);
    packer.unpack_field_int(data_in, 16);
    packer.unpack_field_int(data_out, 1);
  endfunction
endclass
