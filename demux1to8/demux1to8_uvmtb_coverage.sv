class demux_coverage_collector extends uvm_component;
  
  uvm_analysis_port #(demux_seq_item) ap;
  
  covergroup demux_cg;
    coverpoint sel_cp;
    coverpoint data_in_cp;
  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void write_demux_seq_item(demux_seq_item item);
    sample(item.sel, item.data_in);
  endfunction

  function void connect_phase(uvm_phase phase);
    ap.connect_analysis_export(this, "write_demux_seq_item");
  endfunction
  
  function void build_phase(uvm_phase phase);
    demux_cg = new();
  endfunction

  function void sample(bit [2:0] sel, bit data_in);
    demux_cg.sel_cp <= sel;
    demux_cg.data_in_cp <= data_in;
    demux_cg.sample();
  endfunction

endclass
