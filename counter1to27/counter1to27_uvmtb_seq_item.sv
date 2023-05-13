`timescale 1ns / 1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

// Define the sequence item
class counter_seq_item extends uvm_sequence_item;
    rand bit reset;

    constraint reset_c { reset == 0 || reset == 1; }

    function new(string name = "counter_seq_item");
        super.new(name);
    endfunction
endclass
