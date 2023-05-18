class coverage extends uvm_subscriber #(seq_item);
  `uvm_component_utils(coverage)

  // Covergroup for 1011 sequence
  covergroup cg_sequence_1011;
    cp_data_in: coverpoint data_in;
    cp_detection: coverpoint detection {
      bins detected = {1};
      bins not_detected = {0};
    }
    cp_sequence: cross cp_data_in, cp_detection;
  endgroup

  cg_sequence_1011 cg;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cg = new();
  endfunction

  function void write(seq_item t);
    cg.sample(t.data_in, t.vif.detection);
  endfunction
endclass
