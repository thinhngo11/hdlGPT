class mc_test extends uvm_test;
    `uvm_component_utils(mc_test)

    mc_env env;
    virtual magnitude_comparator_if mc_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = mc_env::type_id::create("env", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        env.mc_if = mc_if;
    endfunction
endclass
