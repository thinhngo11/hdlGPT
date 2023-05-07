class decoder_4to16_test extends uvm_test;
    `uvm_component_utils(decoder_4to16_test)

    // Environment
    decoder_4to16_env env;

    // Constructor
    function new(string name = "decoder_4to16_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = decoder_4to16_env::type_id::create("env", this);
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    // End of test
    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        $display("Simulation Finished!");
    endfunction

endclass
