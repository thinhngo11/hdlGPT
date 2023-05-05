class mc_base_sequence extends uvm_sequence #(mc_seq_item);
    `uvm_object_utils(mc_base_sequence)

    function new(string name = "mc_base_sequence");
        super.new(name);
    endfunction

    virtual task body();
        mc_seq_item item;
        repeat(50) begin
            item = mc_seq_item::type_id::create("item");
            start_item(item);
            item.randomize();
            finish_item(item);
            item.A_greater = (item.A > item.B);
            item.A_equal = (item.A == item.B);
            item.A_less = (item.A < item.B);
            `uvm_info(get_type_name(), $sformatf("Generated item: %s", item.sprint()), UVM_LOW)
        end
    endtask
endclass
