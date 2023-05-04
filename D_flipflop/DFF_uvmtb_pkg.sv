package d_flip_flop_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    class d_flip_flop_seq_item extends uvm_sequence_item;
        rand bit D;
        rand bit RST;

        function new(string name = "d_flip_flop_seq_item");
            super.new(name);
        endfunction

        function string convert2string();
            return $sformatf("D: %b, RST: %b", D, RST);
        endfunction
    endclass
endpackage
