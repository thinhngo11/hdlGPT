class decoder_4to16_agent extends uvm_agent;
    `uvm_component_utils(decoder_4to16_agent)

    decoder_4to16_driver driver;
    decoder_4to16_monitor monitor;
    
    // Port
    virtual decoder_4to16_if.tb_mp vif;

    // Constructor
    function new(string name = "decoder_4to16_agent", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual decoder_4to16_if.tb_mp)::get(this, "", "vif", vif))
            `uvm_fatal(get_type_name(), "Virtual interface must be set for decoder_4to16_agent!")
        driver = decoder_4to16_driver::type_id::create("driver", this);
        monitor = decoder_4to16_monitor::type_id::create("monitor", this);        
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        fork
            main_phase(phase);
        join_none
    endtask

    // Main phase
    virtual task main_phase(uvm_phase phase);
        repeat(10) begin
            automatic int sel_val = $urandom_range(0, 15);
            vif.sel <= sel_val;
            #10; // Wait 10 time units before changing the input
        end
    endtask

endclass
