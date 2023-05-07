class decoder_4to16_monitor extends uvm_monitor;
    `uvm_component_utils(decoder_4to16_monitor)

    // Ports
    uvm_analysis_port #(decoder_4to16_item) item_port;
    virtual decoder_4to16_if.tb_mp vif;

    // Constructor
    function new(string name = "decoder_4to16_monitor", uvm_component parent);
        super.new(name, parent);
        item_port = new("item_port", this);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual decoder_4to16_if.tb_mp)::get(this, "", "vif", vif))
            `uvm_fatal(get_type_name(), "Virtual interface must be set for decoder_4to16_monitor!")
    endfunction

    // Main task
    virtual task run_phase(uvm_phase phase);
        decoder_4to16_item item;

        forever begin
            @ (posedge vif.out);
            item = decoder_4to16_item::type_id::create("item");
            item.sel = vif.sel;
            item.out = vif.out;

            // Assertions
            assert_out_onehot(item.sel, item.out);
            assert_out_decoder(item.sel, item.out);

            item_port.write(item);
        end
    endtask

    // Assertion: Check if the output is one-hot
    function void assert_out_onehot(bit [3:0] sel, bit [15:0] out);
        assert ($onehot(out)) else
            `uvm_error(get_type_name(), $sformatf("Non-one-hot output: sel = %0b, out = %0b", sel, out))
    endfunction

    // Assertion: Check if the output correctly corresponds to the selected input
    function void assert_out_decoder(bit [3:0] sel, bit [15:0] out);
        assert (out === (1 << sel)) else
            `uvm_error(get_type_name(), $sformatf("Decoder mismatch: sel = %0b, out = %0b", sel, out))
    endfunction

endclass
