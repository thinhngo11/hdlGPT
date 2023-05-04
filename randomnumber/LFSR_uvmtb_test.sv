class rng_test extends uvm_test;
    `uvm_component_utils(rng_test)

    rng_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = rng_env::type_id::create("env", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_config_db#(rng_if)::set(this, "*.env", "rng_if", uvm_test_top.rng_if);
    endfunction
endclass
