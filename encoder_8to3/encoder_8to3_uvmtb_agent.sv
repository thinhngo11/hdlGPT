class encoder_8to3_agent extends uvm_agent;
    `uvm_component_utils(encoder_8to3_agent)

    encoder_8to3_driver driver;
    encoder_8to3_monitor monitor;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        driver = encoder_8to3_driver::type_id::create("driver", this);
        monitor = encoder_8to3_monitor::type_id::create("monitor", this);
    endfunction
endclass
