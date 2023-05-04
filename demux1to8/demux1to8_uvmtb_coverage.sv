class demux_coverage_collector extends uvm_component;
  covergroup demux_cg;
    coverpoint sel_cp;
    coverpoint data_in_cp;
  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
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
