class seq_1011 extends uvm_sequence #(seq_item);
  `uvm_object_utils(seq_1011)

  function new(string name = "seq_1011");
    super.new(name);
  endfunction

  task body();
    seq_item item = new();
    repeat(50) begin
      item.randomize();
      start_item(item);
      finish_item(item);
      #10;
    end
  endtask
endclass
