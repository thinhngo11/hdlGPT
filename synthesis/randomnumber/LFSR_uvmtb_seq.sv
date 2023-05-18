class rng_seq extends uvm_sequence#(rng_seq_item);
    `uvm_object_utils(rng_seq)

    function new(string name = "rng_seq");
        super.new(name);
    endfunction

    task body();
        rng_seq_item item;

        repeat (10) begin
            item = rng_seq_item::type_id::create("item");
            start_item(item);
            item.randomize();
            finish_item(item);
            #10;
        end
    endtask
endclass
