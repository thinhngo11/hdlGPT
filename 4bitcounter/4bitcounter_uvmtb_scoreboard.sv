class counter_scoreboard extends uvm_scoreboard;
    // TLM import
    uvm_analysis_imp #(counter_transaction, counter_scoreboard) analysis_export;

    // Constructor
    function new(string name = "counter_scoreboard", uvm_component parent);
        super.new(name, parent);

        analysis_export = new("analysis_export", this);
    endfunction

    // Write function
    function void write(counter_transaction tr);
        // Check and display transaction information
        $display("[SCOREBOARD] Received transaction: %s", tr.sprint());
    endfunction
endclass
