class encoder_8to3_base_sequence extends uvm_sequence #(encoder_8to3_seq_item);
    `uvm_object_utils(encoder_8to3_base_sequence)

    function new(string name = "encoder_8to3_base_sequence");
        super.new(name);
    endfunction

    virtual task body();
        encoder_8to3_seq_item item;

        repeat(100) begin
            item = encoder_8to3_seq_item::type_id::create("item");
            assert(item.randomize()) else `uvm_error("SEQ_ERROR", "Randomization error")
            start_item(item);
            finish_item(item);
        end
    endtask
endclass
