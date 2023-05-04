class demux_agent extends uvm_agent;
  uvm_analysis_port #(demux_seq_item) ap;

  demux_driver driver;
  demux_monitor monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    driver = demux_driver::type_id::create("driver", this);
    monitor = demux_monitor::type_id::create("monitor", this);
    ap = monitor.ap;
  endfunction

  function void connect_phase(uvm_phase phase);
    if (is_active()) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction

endclass
