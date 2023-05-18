class counter_scoreboard extends uvm_subscriber #(counter_seq_item);
    int count;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        count = 1;
    endfunction

    virtual task write(uvm_tlm_analysis_fifo #(counter_seq_item) fifo, counter_seq_item t);
        if (t.reset) begin
            count = 1;
        end else begin
            count = (count == 27) ? 1 : count + 1;
        end

        if (count !== t.count) begin
            `uvm_error(get_type_name(), $sformatf("Mismatch detected! Expected: %0d, Observed: %0d", count, t.count))
        end else begin
            `uvm_info(get_type_name(), $sformatf("Match detected! Expected: %0d, Observed: %0d", count, t.count), UVM_LOW)
        end
    endtask
endclass
