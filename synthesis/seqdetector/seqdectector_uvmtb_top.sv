// Top module
module top;
  logic clk;

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  sequence_detector_if sequence_detector_vif(.clk(clk));

  initial begin
    uvm_default_table_printer.knobs.row_compact = 1;
    uvm_default_table_printer.knobs.size.width = 2;
    uvm_default_table_printer.knobs.type_name.width = 40;
    uvm_default_table_printer.knobs.size.unit = "K";
    uvm_default_table_printer.knobs.size.precision = 0;

    uvm_default_line_printer.knobs.unit = "K";
    uvm_default_line_printer.knobs.precision = 0;

    uvm_default_tree_printer.knobs.unit = "K";
    uvm_default_tree_printer.knobs.precision = 0;

    uvm_default_printer = uvm_default_table_printer;

    uvm_default_table_printer.knobs.type_override = 1;
    uvm_default_table_printer.knobs.type_width = 7;
    uvm_default_table_printer.knobs.size_width = 7;

    uvm_default_line_printer.knobs.type_width = 7;
    uvm_default_line_printer.knobs.size_width = 7;

    uvm_default_tree_printer.knobs.type_width = 7;
    uvm_default_tree_printer.knobs.size_width = 7;
  end

  initial begin
    test test_inst = test::type_id::create("test_inst");
    test_inst.vif = sequence_detector_vif;
    uvm_config_db#(virtual sequence_detector_if)::set(null, "uvm_test_top", "vif", sequence_detector_vif);
    uvm_default_table_printer.knobs.name_width = 20;
    run_test();
  end
endmodule
