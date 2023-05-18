class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)

  uvm_analysis_export #(seq_item) exp;
  uvm_tlm_analysis_fifo #(seq_item) input_fifo;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    exp = new("exp", this);
    input_fifo = new("input_fifo");
  endfunction

  function void connect_phase(uvm_phase phase);
    exp.connect(input_fifo.analysis_export);
  endfunction

  task run_phase(uvm_phase phase);
    seq_item item;
    bit [3:0] pattern;
    bit expected_detection;

    forever begin
      input_fifo.get(item);
      @(posedge item.vif.clk);
      pattern = {pattern[2:0], item.data_in};
      expected_detection = (pattern == 4'b1011);
      if (item.vif.detection !== expected_detection) begin
        `uvm_error(get_type_name(), $sformatf("Mismatch detected: expected %b, got %b", expected_detection, item.vif.detection));
      end
    end
  endtask
endclass
