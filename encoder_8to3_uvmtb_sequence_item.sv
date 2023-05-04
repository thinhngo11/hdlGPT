class encoder_8to3_seq_item extends uvm_sequence_item;
        rand bit [7:0] data;
        rand bit [2:0] encoded_data;

        // Constraint to make sure only one bit is high at a time
        constraint one_bit_high { $onehot(data); }

        function new(string name = "encoder_8to3_seq_item");
            super.new(name);
        endfunction

        function string convert2string();
            return $sformatf("data: %0b, encoded_data: %0b", data, encoded_data);
        endfunction
    endclass
