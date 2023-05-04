`include "fifo_pkg.sv"

class fifo_env extends uvm_env;
    `uvm_component_utils(fifo_env)

    fifo_agent agent;
    fifo_monitor monitor;
    fifo_scoreboard scoreboard;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        agent = fifo_agent::type_id::create("agent", this);
        monitor = fifo_monitor::type_id::create("monitor", this);
        scoreboard = fifo_scoreboard::type_id::create("scoreboard", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        monitor.ap.connect(scoreboard.fifo_fifo.analysis_export);
    endfunction
endclass
