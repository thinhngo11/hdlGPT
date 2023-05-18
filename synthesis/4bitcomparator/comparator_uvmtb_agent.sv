class mc_agent extends uvm_agent;
    `uvm_component_utils(mc_agent)

    mc_driver drv;
    mc_monitor mon;
    virtual magnitude_comparator_if mc_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        drv = mc_driver::type_id::create("drv", this);
        mon = mc_monitor::type_id::create("mon", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        drv.mc_if = mc_if;
        mon.mc_if = mc_if;
    endfunction
endclass
