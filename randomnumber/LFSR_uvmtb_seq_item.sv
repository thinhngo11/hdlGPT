class rng_seq_item extends uvm_sequence_item;
    `uvm_object_utils(rng_seq_item)

    rand bit rst;

    function new(string name = "");
        super.new(name);
    endfunction
endclass
