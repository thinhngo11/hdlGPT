class decoder_4to16_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(decoder_4to16_scoreboard)

    uvm_analysis_export #(decoder_4to16_item) item_export;
    uvm_tlm_analysis_fifo #(decoder_4to16_item) item_fifo;

    // Constructor
    function new(string name = "decoder_4to16_scoreboard", uvm_component parent);
        super.new(name, parent);
        item_export = new("item_export", this);
        item_fifo = new("item_fifo");
    endfunction

    // Main task
    virtual task run_phase(uvm_phase phase);
        decoder_4to16_item item;

        forever begin
            item_fifo.get(item);
            check_output(item);
        end
    endtask

    // Check the output
    virtual function void check_output(decoder_4to16_item item);
        bit [15:0] expected_out = 1 << item.sel;

        if (item.out !== expected_out)
            `uvm_error(get_type_name(), $sformatf("Mismatch: sel = %0b, expected = %0b, actual = %0b",
                                                  item.sel, expected_out, item.out))
    endfunction

endclass
