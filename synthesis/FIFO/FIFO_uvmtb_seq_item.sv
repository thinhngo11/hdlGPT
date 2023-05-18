 // FIFO transaction class
    class fifo_transaction extends uvm_sequence_item;
        rand bit [7:0] data;
        rand fifo_trans_type_e trans_type;

        constraint data_c { data > 0; }

        `uvm_object_utils_begin(fifo_transaction)
            `uvm_field_int(data, UVM_DEFAULT)
            `uvm_field_enum(fifo_trans_type_e, trans_type, UVM_DEFAULT)
        `uvm_object_utils_end

        function new (string name = "fifo_transaction");
            super.new(name);
        endfunction
    endclass
