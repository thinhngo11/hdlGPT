class counter_agent extends uvm_agent;
    uvm_analysis_port #(counter_seq_item) ap;
    uvm_sequencer #(counter_seq_item) seqr;
    counter_driver drv;
    counter_monitor mon;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        seqr = uvm_sequencer#(counter_seq_item)::type_id::create("seqr", this);
        drv = counter_driver::type_id::create("drv", this);
        mon = counter_monitor::type_id::create("mon", this);
        ap = new("ap", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
        ap.connect(mon.ap);
    endfunction
endclass
