class rng_monitor extends uvm_monitor;
    `uvm_component_utils(rng_monitor)
    
    // Declaration
    rand bit [7:0] rng_out;
    rand bit [7:0] rng_out_prev;
    rng_cg rng_cg_inst;

    rng_if rng_if;
    uvm_analysis_port#(logic[7:0]) item_port;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_port = new("item_port", this);
        rng_cg_inst = new();
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        uvm_config_db#(rng_if)::get(this, "", "rng_if", rng_if);
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever @(posedge rng_if.clk) begin
            rng_out_prev = rng_out;
            rng_out = dut_inst.rng_out;
            rng_cg_inst.sample();
            item_port.write(rng_if.random_number);
        end
    endtask
endclass
