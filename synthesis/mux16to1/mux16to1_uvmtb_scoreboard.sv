class mux_scoreboard extends uvm_scoreboard;

  uvm_analysis_export #(mux_transaction) exp;
  uvm_tlm_analysis_fifo #(mux_transaction) fifo;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    fifo = new("fifo", this);
    exp = new("exp", this);
    exp.connect(fifo.analysis_export);
  endfunction

  virtual task run_phase(uvm_phase phase);
    mux_transaction tr;
    forever begin
      fifo.get(tr);
      if (tr.data_out !== tr.data_in[tr.sel]) begin
        `uvm_error(get_type_name(), $sformatf("Mismatch: sel = %0d, data_in = %h, data_out = %b", tr.sel, tr.data_in, tr.data_out));
      end
    end
  endtask
endclass
