class demux_base_sequence extends uvm_sequence #(demux_seq_item);
  `uvm_object_utils(demux_base_sequence)

  function new(string name = "demux_base_sequence");
    super.new(name);
  endfunction

  task body();
    demux_seq_item item;
    int unsigned i;

    for (i = 0; i < 16; i++) begin
      item = demux_seq_item::type_id::create("item");
      start_item(item);
      item.randomize();
      finish_item(item);
    end
  endtask

endclass
