class decoder_4to16_item extends uvm_sequence_item;
    `uvm_object_utils(decoder_4to16_item)

    rand bit [3:0] sel;
    bit [15:0] out;

    // Constraints
    constraint sel_c { sel < 16; }

    // Constructor
    function new(string name = "decoder_4to16_item");
        super.new(name);
    endfunction

    // Print the contents of the sequence item
    function string convert2string();
        return $sformatf("sel: %0b, out: %0b", sel, out);
    endfunction

endclass
