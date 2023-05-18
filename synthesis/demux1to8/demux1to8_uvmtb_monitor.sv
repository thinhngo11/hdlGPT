class demux_monitor extends uvm_monitor;
  virtual demux_if intf;
  uvm_analysis_port #(demux_seq_item) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  task run_phase(uvm_phase phase);
    demux_seq_item item = demux_seq_item::type_id::create("item");

    forever begin
      @(posedge intf.sel or posedge intf.data_in);
      
      item = demux_seq_item::type_id::create("item");
      item.sel = intf.sel;
      item.data_in = intf.data_in;
      item.data_out = intf.data_out;
      
      ap.write(item);
    end
  endtask

endclass
