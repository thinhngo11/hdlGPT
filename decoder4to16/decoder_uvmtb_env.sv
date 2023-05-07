class decoder_4to16_env extends uvm_env;
    `uvm_component_utils(decoder_4to16_env)

    // Agent
    decoder_4to16_agent agent;

    // Constructor
    function new(string name = "decoder_4to16_env", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = decoder_4to16_agent::type_id::create("agent", this);
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

endclass
