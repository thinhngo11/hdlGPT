class counter_coverage_collector extends uvm_subscriber #(counter_seq_item);
    bit [1:0] reset_coverage;
    bit [1:0][27:1] count_coverage;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task write(uvm_tlm_analysis_fifo #(counter_seq_item) fifo, counter_seq_item t);
        reset_coverage[t.reset] = 1;
        count_coverage[t.reset][t.count] = 1;
    endtask

    function void report_coverage();
        int reset_hits;
        int count_hits;
        
        foreach (reset_coverage[i]) begin
            reset_hits += reset_coverage[i] ? 1 : 0;
        end
        
        foreach (count_coverage[i][j]) begin
            count_hits += count_coverage[i][j] ? 1 : 0;
        end

        `uvm_info(get_type_name(), $sformatf("Reset coverage: %0d%%", (reset_hits * 100) / 2), UVM_MEDIUM)
        `uvm_info(get_type_name(), $sformatf("Count coverage: %0d%%", (count_hits * 100) / 54), UVM_MEDIUM)
    endfunction
endclass
