class mux_monitor extends uvm_monitor;

  mux_if intf;
  uvm_analysis_port #(mux_transaction) ap;

  covergroup mux_cg(string name) @(posedge intf.clk);
    option.per_instance = 1;
    option.comment = name;

    coverpoint sel_cp {
      bins sel[] = {[0:15]};
    }

    coverpoint data_in_cp {
      bins data_in[] = {[0:65535]};
    }

    cross sel_cp, data_in_cp;
  endgroup

  mux_cg cg;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    ap = new("ap", this);
    cg = new("mux_cg");    
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
