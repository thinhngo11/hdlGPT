class mux_sequence extends uvm_sequence #(mux_transaction);

  `uvm_object_utils(mux_sequence)

  function new(string name = "mux_sequence");
    super.new(name);
  endfunction

  task body();
    mux_transaction tr = new();
    repeat(100) begin
      tr.randomize();
      tr.data_out = tr.data_in[tr.sel];
      start_item(tr);
      finish_item(tr);
      get_response(tr);
    end
  endtask
endclass
