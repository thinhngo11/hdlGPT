class mc_seq_item extends uvm_sequence_item;
    `uvm_object_utils(mc_seq_item)

    rand bit [3:0] A, B;
    bit A_greater, A_equal, A_less;

    function new(string name = "mc_seq_item");
        super.new(name);
    endfunction

    function void do_copy(uvm_object rhs);
        mc_seq_item other;
        super.do_copy(rhs);
        other = mc_seq_item(rhs);
        A = other.A;
        B = other.B;
        A_greater = other.A_greater;
        A_equal = other.A_equal;
        A_less = other.A_less;
    endfunction

    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        mc_seq_item other;
        other = mc_seq_item(rhs);
        if (A != other.A) return 0;
        if (B != other.B) return 0;
        if (A_greater != other.A_greater) return 0;
        if (A_equal != other.A_equal) return 0;
        if (A_less != other.A_less) return 0;
        return 1;
    endfunction
endclass
