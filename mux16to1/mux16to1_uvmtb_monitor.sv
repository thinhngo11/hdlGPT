class mux_monitor extends uvm_monitor;

  mux_if intf;
  uvm_analysis_port #(mux_transaction) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    ap = new("ap", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    mux_transaction tr = new();
    forever begin
      @(posedge intf.clk);
      tr.sel = intf.sel;
      tr.data_in = intf.data_in;
      tr.data_out = intf.data_out;
      ap.write(tr);
    end
  endtask
endclass
