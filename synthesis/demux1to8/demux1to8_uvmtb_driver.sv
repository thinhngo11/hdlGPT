class demux_driver extends uvm_driver #(demux_seq_item);
  virtual interface demux_if intf;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    demux_seq_item item;

    forever begin
      seq_item_port.get_next_item(item);
      fork
        begin
          intf.sel <= item.sel;
          intf.data_in <= item.data_in;
          #10;
          item.data_out = intf.data_out;

          seq_item_port.item_done(item);
        end
      join_none
    end
  endtask

endclass
