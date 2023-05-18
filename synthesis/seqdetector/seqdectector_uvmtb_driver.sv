// Define driver
class driver extends uvm_driver #(seq_item);
  virtual interface sequence_detector_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    seq_item item;
    forever begin
      seq_item_port.get_next_item(item);
      vif.data_in <= item.data_in;
      #10;
      seq_item_port.item_done();
    end
  endtask

  `uvm_component_utils(driver)
endclass
