`include "fifo_pkg.sv"

class fifo_agent extends uvm_agent;
    `uvm_component_utils(fifo_agent)

    // Agent components
    fifo_driver driver;
    fifo_sequencer sequencer;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        driver = fifo_driver::type_id::create("driver", this);
        sequencer = fifo_sequencer::type_id::create("sequencer", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction
endclass
