class mc_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(mc_scoreboard)

    uvm_analysis_export #(mc_seq_item) item_export;
    uvm_tlm_analysis_fifo #(mc_seq_item) item_fifo;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_export = new("item_export", this);
        item_fifo = new("item_fifo");
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        item_export.connect(item_fifo.analysis_export);
    endfunction

    virtual task run_phase(uvm_phase phase);
        mc_seq_item item;
        forever begin
            item_fifo.get(item);
            if(item.A_greater !== (item.A > item.B) || item.A_equal !== (item.A == item.B) || item.A_less !== (item.A < item.B)) begin
                `uvm_error(get_type_name(), "Mismatch found in the scoreboard.")
                `uvm_info(get_type_name(), $sformatf("Received item: %s", item.sprint()), UVM_LOW)
            end
        end
    endtask
endclass
