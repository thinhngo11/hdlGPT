class loadable_shift_register_sequence extends uvm_sequence #(loadable_shift_register_item);
    `uvm_object_utils(loadable_shift_register_sequence)
    `uvm_declare_p_sequencer(loadable_shift_register_sequencer)

    function new(string name = "loadable_shift_register_sequence");
        super.new(name);
    endfunction

    task body();
        loadable_shift_register_item item;

        repeat (20) begin
            item = loadable_shift_register_item::type_id::create("item");

            // Randomizing sequence item
            assert(item.randomize());
            item.data_out = 0;

            // Send item to the sequencer
            start_item(item);
            finish_item(item);

            #10;
        end
    endtask
endclass
