class loadable_shift_register_test extends uvm_test;
    `uvm_component_utils(loadable_shift_register_test)

    loadable_shift_register_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = loadable_shift_register_env::type_id::create("env", this);
    endfunction

    function void run_phase(uvm_phase phase);
        phase.raise_objection(this, "Starting test");

        // Start sequence
        loadable_shift_register_sequence seq = new();
        seq.start(env.agent.sequencer);

        phase.drop_objection(this, "Test completed");
    endfunction
endclass
