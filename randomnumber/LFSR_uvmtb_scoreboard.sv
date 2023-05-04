class rng_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(rng_scoreboard)

    uvm_analysis_imp#(logic[7:0], rng_scoreboard) item_collector;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collector = new("item_collector", this);
    endfunction

    virtual function void write(logic[7:0] item);
        $display("[SCOREBOARD] Time: %t, Random number: %0h", $time, item);
    endfunction
endclass
