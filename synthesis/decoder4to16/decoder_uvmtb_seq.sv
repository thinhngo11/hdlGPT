class decoder_4to16_seq extends uvm_sequence #(decoder_4to16_item);
    `uvm_object_utils(decoder_4to16_seq)

    // Constructor
    function new(string name = "decoder_4to16_seq");
        super.new(name);
    endfunction

    // Main task
    virtual task body();
        decoder_4to16_item item;

        repeat(10) begin
            item = decoder_4to16_item::type_id::create("item");
            start_item(item);
            if (!item.randomize())
                `uvm_error(get_type_name(), "Randomization failed")
            finish_item(item);
            `uvm_info(get_type_name(), $sformatf("Seq Item: %s", item.convert2string()), UVM_MEDIUM)
        end
    endtask

endclass
