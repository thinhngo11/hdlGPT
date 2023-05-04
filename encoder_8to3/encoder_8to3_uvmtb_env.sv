// Add this import statement to encoder_8to3_env.sv
import encoder_8to3_pkg::*;

class encoder_8to3_env extends uvm_env;
    `uvm_component_utils(encoder_8to3_env)

    encoder_8to3_agent agent;
    encoder_8to3_scoreboard scoreboard;
    encoder_8to3_coverage coverage; // Add this line

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = encoder_8to3_agent::type_id::create("agent", this);
        scoreboard = encoder_8to3_scoreboard::type_id::create("scoreboard", this);
        coverage = encoder_8to3_coverage::type_id::create("coverage", this); // Add this line
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.monitor.item_port.connect(scoreboard.item_export);
        agent.monitor.item_port.connect(coverage.analysis_export); // Add this line
    endfunction
endclass
