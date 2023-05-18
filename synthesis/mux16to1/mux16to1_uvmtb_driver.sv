class mux_driver extends uvm_driver #(mux_transaction);

  mux_if intf;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      intf.data_in <= req.data_in;
      intf.sel <= req.sel;
      @(posedge intf.clk);
      seq_item_port.item_done();
      seq_item_port.put_response(req);
    end
  endtask
endclass
