// dff_sequence.sv
class dff_sequence extends uvm_sequence #(dff_seq_item);
  `uvm_object_utils(dff_sequence)

  function new(string name = "dff_sequence");
    super.new(name);
  endfunction

  task body();
    dff_seq_item seq_item;
    repeat(10) begin
      seq_item = dff_seq_item::type_id::create("seq_item");
      start_item(seq_item);
      randomize(seq_item);
      finish_item(seq_item);
    end
  endtask
endclass
