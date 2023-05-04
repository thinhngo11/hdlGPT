class encoder_8to3_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(encoder_8to3_scoreboard)

    uvm_analysis_export #(encoder_8to3_seq_item) item_export;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        item_export = new("item_export", this);
    endfunction

    virtual function void write(encoder_8to3_seq_item item);
        encoder_8to3_seq_item expected_item = new();
        expected_item.data = item.data;
        expected_item.encoded_data = $clog2(item.data);
        if (item.encoded_data !== expected_item.encoded_data) begin
            `uvm_error("SB_ERROR", $sformatf("Mismatch: expected %0b, got %0b", expected_item.encoded_data, item.encoded_data))
        end else begin
            `uvm_info("SB_INFO", $sformatf("Match: %0b", item.encoded_data), UVM_LOW)
        end
    endfunction
endclass
