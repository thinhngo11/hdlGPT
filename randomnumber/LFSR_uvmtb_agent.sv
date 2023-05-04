class rng_agent extends uvm_agent;
    `uvm_component_utils(rng_agent)

    rng_if rng_if;
    uvm_sequencer seqr;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        uvm_config_db#(rng_if)::get(this, "", "rng_if", rng_if);
    endfunction

    task main_phase(uvm_phase phase);
        fork
            apply_reset();
        join_none
    endtask

    task apply_reset();
        repeat (10) begin
            rng_if.rst <= $urandom_range(0, 1);
            #10;
        end
        rng_if.rst <= 0;
    endtask
endclass
