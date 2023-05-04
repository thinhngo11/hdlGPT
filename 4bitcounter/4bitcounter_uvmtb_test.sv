class counter_test extends uvm_test;
    // Components
    counter_env env;

    // Constructor
    function new(string name = "counter_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env = counter_env::type_id::create("env", this);
    endfunction

    // Main phase
    task main_phase(uvm_phase phase);
        // Create and start the test sequence
        counter_sequence seq;
        seq = counter_sequence::type_id::create("seq");
        seq.start(env.agent.sequencer);
    endtask
endclass
