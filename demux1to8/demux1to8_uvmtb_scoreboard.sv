class demux_scoreboard extends uvm_scoreboard;
  uvm_analysis_export #(demux_seq_item) exp;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    exp = new("exp", this);
  endfunction

  function void write_demux_seq_item(demux_seq_item item);
    bit [7:0] expected_data_out;

    expected_data_out = 8'b0;
    expected_data_out[item.sel] = item.data_in;

    if (item.data_out !== expected_data_out) begin
      `uvm_error("CHECK", $sformatf("Mismatch detected: expected_data_out=%0b, data_out=%0b", expected_data_out, item.data_out))
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    exp.connect_analysis_export(this, "write_demux_seq_item");
  endfunction

endclass
