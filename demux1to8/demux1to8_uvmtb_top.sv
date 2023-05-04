module tb;
  import uvm_pkg::*;

  bit clk;
  demux_if intf(.*);

  always #5 clk = ~clk;

  initial begin
    uvm_config_db #(virtual demux_if)::set(null, "*", "intf", intf);
    run_test("demux_base_test");
  end
endmodule
