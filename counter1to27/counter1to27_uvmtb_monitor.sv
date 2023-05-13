class counter_monitor extends uvm_monitor;
    virtual interface counter_if intf;

    uvm_analysis_port #(counter_seq_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        counter_seq_item mon_item;

        forever begin
            @(posedge intf.clk);
            mon_item = counter_seq_item::type_id::create("mon_item",,get_full_name());
            mon_item.reset = intf.reset;
            ap.write(mon_item);
        end
    endtask
endclass
