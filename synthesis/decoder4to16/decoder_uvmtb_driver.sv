class decoder_4to16_driver extends uvm_driver #(decoder_4to16_item);
    `uvm_component_utils(decoder_4to16_driver)

    virtual decoder_4to16_if.tb_mp vif;

    // Constructor
    function new(string name = "decoder_4to16_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual decoder_4to16_if.tb_mp)::get(this, "", "vif", vif))
            `uvm_fatal(get_type_name(), "Virtual interface must be set for decoder_4to16_driver!")
    endfunction

    // Drive task
    virtual task drive(decoder_4to16_item item);
        vif.sel <= item.sel;
        #10; // Wait 10 time units before changing the input
    endtask

    // Main task
    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            drive(req);
            seq_item_port.item_done();
        end
    endtask

endclass
