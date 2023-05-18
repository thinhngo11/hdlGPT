class d_flip_flop_test extends uvm_test;
    `uvm_component_utils(d_flip_flop_test)

    d_flip_flop_env env;

    function new(string name = "d_flip_flop_test");
        super.new(name);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = d_flip_flop_env::type_id::create("env", this);
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_config_db#(virtual d_flip_flop_if.dut)::set(null, "*.env.agent.*", "intf", p_intf);
    endfunction
endclass
