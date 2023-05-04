class loadable_shift_register_item extends uvm_sequence_item;
    `uvm_object_utils(loadable_shift_register_item)

    rand bit reset;
    rand bit load;
    rand bit [7:0] data_in;
    rand bit shift_in;
    bit [7:0] data_out;

    constraint c_shift { shift_in inside {0, 1}; }

    function new(string name = "loadable_shift_register_item");
        super.new(name);
    endfunction

    function void do_copy(uvm_object rhs);
        loadable_shift_register_item other;
        if (!$cast(other, rhs)) `uvm_fatal("do_copy", "Cast failed");
        super.do_copy(rhs);
        reset = other.reset;
        load = other.load;
        data_in = other.data_in;
        shift_in = other.shift_in;
        data_out = other.data_out;
    endfunction

    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        loadable_shift_register_item other;
        if (!$cast(other, rhs)) return 0;
        if (!super.do_compare(rhs, comparer)) return 0;
        return (reset == other.reset) && (load == other.load) &&
            (data_in == other.data_in) && (shift_in == other.shift_in) &&
            (data_out == other.data_out);
    endfunction
endclass
