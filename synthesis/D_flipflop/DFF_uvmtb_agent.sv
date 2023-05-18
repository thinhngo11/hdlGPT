class d_flip_flop_agent extends uvm_agent;
    `uvm_component_utils(d_flip_flop_agent)

    d_flip_flop_driver driver;
    d_flip_flop_monitor monitor;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        driver = d_flip_flop_driver::type_id::create("driver", this);
        monitor = d_flip_flop_monitor::type_id::create("monitor", this);
    endfunction
endclass
