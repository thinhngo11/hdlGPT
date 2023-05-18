class counter_transaction extends uvm_sequence_item;
    bit reset;
    bit load;
    bit up_down;
    logic [3:0] load_data;
    logic [3:0] count;

    // Constructor
    function new(string name = "counter_transaction");
        super.new(name);
    endfunction

    // Print function
    function void do_print(uvm_printer printer);
        printer.print_field("reset", reset, 1);
        printer.print_field("load", load, 1);
        printer.print_field("up_down", up_down, 1);
        printer.print_field("load_data", load_data, 4);
        printer.print_field("count", count, 4);
    endfunction
endclass
