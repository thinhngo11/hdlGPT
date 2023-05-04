1. Add a cover property in the `demux_monitor` to track the activation of each output bit:

```systemverilog
class demux_monitor extends uvm_monitor;
  virtual demux_if intf;
  uvm_analysis_port #(demux_seq_item) ap;

  // ... (previous code in the class)

  task run_phase(uvm_phase phase);
    demux_seq_item item = demux_seq_item::type_id::create("item");
    int unsigned i;

    // Add cover properties for each output bit
    for (i = 0; i < 8; i++) begin
      cover property (@(posedge intf.sel or posedge intf.data_in)
        (intf.data_out[i] == 1'b1)) else
        $error($sformatf("Cover property failed: Output bit %0d is never set to 1", i));
    end

    // ... (previous code in the task)
  endtask

endclass
```

2. Add a cover property in the `demux_monitor` to track the activation of each 'sel' value:

```systemverilog
class demux_monitor extends uvm_monitor;
  virtual demux_if intf;
  uvm_analysis_port #(demux_seq_item) ap;

  // ... (previous code in the class)

  task run_phase(uvm_phase phase);
    demux_seq_item item = demux_seq_item::type_id::create("item");
    int unsigned i;

    // ... (previous cover properties)

    // Add cover properties for each 'sel' value
    for (i = 0; i < 8; i++) begin
      cover property (@(posedge intf.sel or posedge intf.data_in)
        (intf.sel == i[2:0])) else
        $error($sformatf("Cover property failed: 'sel' value %0b is never exercised", i[2:0]));
    end

    // ... (previous code in the task)
  endtask

endclass
