module top;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  wire clk;
  wire [3:0] sel;
  wire [15:0] data_in;
  wire data_out;

  mux_if intf (clk);
  mux_16to1 DUT (
    .sel(sel),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Cover Assertions
  cover property (@(posedge clk) data_out === data_in[sel])
    $info("Covered: Output matches the selected input. sel = %0d, data_in = %h, data_out = %b", sel, data_in, data_out);

  cover property (@(posedge clk) $past(sel) === sel && $past(data_in) === data_in |-> data_out === $past(data_out))
    $info("Covered: Output remains stable when inputs and selector signal are stable.");

  // SVA
  always @(posedge clk) begin
    assert (data_out === data_in[sel]) else
      $error("Assertion failed: Output does not match the selected input. sel = %0d, data_in = %h, data_out = %b", sel, data_in, data_out);
  end

  always @(posedge clk) begin
    if ($past(sel) === sel && $past(data_in) === data_in)
      assert (data_out === $past(data_out)) else
        $error("Assertion failed: Output changed while inputs and selector signal were stable.");
  end

  initial begin
    uvm_config_db #(mux_if)::set(null, "uvm_test_top.env", "interface", intf);
    uvm_default_table_printer.knobs.reference = 1;
    uvm_default_table_printer.knobs.type_name_override = 1;
  end

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, top);
  end

  initial begin
    bit toggle;
    forever begin
      #5 clk = ~clk;
    end
  end

  initial begin
    uvm_default_table_printer.knobs.field_hier = UVM_PRINT_MAX;
    uvm_default_table_printer.knobs.field_endian = UVM_LITTLE_ENDIAN;
    uvm_default_table_printer.knobs.field_detail = UVM_PRINT_MAX;
    uvm_default_table_printer.knobs.addr_radix = UVM_BIN;
    uvm_default_table_printer.knobs.data_radix = UVM_BIN;
  end

  initial begin
    uvm_default_table_printer.knobs.reference = 1;
    run_test("mux_test");
  end
endmodule
