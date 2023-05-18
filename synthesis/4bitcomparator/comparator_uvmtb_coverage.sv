class mc_cov_cg extends uvm_component;
    `uvm_component_utils(mc_cov_cg)

    // Covergroup for the magnitude comparator
    covergroup input_combinations @(posedge clk);
        A_cp: coverpoint A;
        B_cp: coverpoint B;

        AxB: cross A_cp, B_cp;
    endgroup

    // Interface handle
    virtual magnitude_comparator_if mc_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db #(virtual magnitude_comparator_if)::get(this, "", "mc_if", mc_if))
            `uvm_fatal(get_type_name(), "mc_if not found in uvm_config_db")
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        input_combinations = new();
    endfunction

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        input_combinations.report();
    endfunction
endclass
