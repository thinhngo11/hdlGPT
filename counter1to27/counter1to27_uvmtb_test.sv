class counter_test extends uvm_test;
    counter_env env;
    uvm_sequencer #(counter_seq_item) seqr;

    function new(string name = "counter_test");
        super.new(name);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = counter_env::type_id::create("env", this);
        seqr = uvm_sequencer#(counter_seq_item)::type_id::create("seqr", this);
    endfunction

    virtual function void run_phase(uvm_phase phase);
        counter_seq_item item;

        for (int i = 0; i < 60; i++) begin
            item = counter_seq_item::type_id::create("item",,get_full_name());
            item.randomize();
            seqr.start_item(item);
            seqr.finish_item(item);
            #10;
        end
    endfunction
endclass
