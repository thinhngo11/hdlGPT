// Define monitor
class monitor extends uvm_monitor;
  virtual interface sequence_detector_if vif;
  uvm_analysis_port #(seq_item) ap;

  function new (string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  task run_phase(uvm_phase phase);
    seq_item item = seq_item::type_id::create("item");
    forever begin
      @(posedge vif.clk);
      item.data_in = vif.data_in;
      ap.write(item);
    end
  endtask

  `uvm_component_utils(monitor)
endclass
