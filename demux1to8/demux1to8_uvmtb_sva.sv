1. Immediate assertions:

Add the following assertions in the `demux_1to8` module to ensure that only one output bit is set at a time:

```systemverilog
module demux_1to8 (
    input wire [2:0] sel,         // select (3-bit)
    input wire data_in,     // data input (1-bit)
    output reg [7:0] data_out // data output (8-bit)
);

// ... (previous code in the module)

always @(posedge sel or posedge data_in) begin
  // Only one bit in data_out should be set
  assert ($onehot0(data_out)) else
    $error("Assertion failed: More than one output bit is set");
end

endmodule
```

2. Concurrent Assertions:

Add a property and an assertion in the `demux_monitor` to check that the selected output bit receives the input data:

```systemverilog
class demux_monitor extends uvm_monitor;
  virtual demux_if intf;
  uvm_analysis_port #(demux_seq_item) ap;

  // ... (previous code in the class)

  task run_phase(uvm_phase phase);
    demux_seq_item item = demux_seq_item::type_id::create("item");

    // Add concurrent assertion
    @(posedge intf.sel or posedge intf.data_in)
      assert property (@(posedge intf.sel or posedge intf.data_in)
        (intf.data_out[intf.sel] == intf.data_in))
        else $error("Assertion failed: The selected output bit does not match the input data");

    // ... (previous code in the task)
  endtask

endclass
