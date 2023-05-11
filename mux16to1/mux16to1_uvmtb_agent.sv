class mux_agent extends uvm_agent;

  mux_sequencer sequencer;
  mux_driver driver;
  mux_monitor monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    sequencer = mux_sequencer::type_id::create("sequencer", this);
    driver = mux_driver::type_id::create("driver", this);
    monitor = mux_monitor::type_id::create("monitor", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    if (get_is_active()) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
      driver.seq_item_port.connect(monitor.seq_item_collector.export);
    end
  endfunction

  virtual function void set_mux_if(mux_if intf);
    driver.intf = intf;
    monitor.intf = intf;
  endfunction
endclass
