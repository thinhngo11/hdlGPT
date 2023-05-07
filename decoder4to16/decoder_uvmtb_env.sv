class decoder_4to16_env extends uvm_env;
    `uvm_component_utils(decoder_4to16_env)

    // Agent
    decoder_4to16_agent agent;  
    decoder_4to16_scoreboard scoreboard;    

    // Constructor
    function new(string name = "decoder_4to16_env", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = decoder_4to16_agent::type_id::create("agent", this);
        scoreboard = decoder_4to16_scoreboard::type_id::create("scoreboard", this);        
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.seq_item_port.connect(driver.seq_item_port);
        agent.item_port.connect(scoreboard.item_export);
    endfunction
endclass
