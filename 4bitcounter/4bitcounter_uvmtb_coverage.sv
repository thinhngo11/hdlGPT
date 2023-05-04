class counter_coverage;
    // Covergroup
    covergroup cg_counter(string name) @(posedge clk);
        option.per_instance = 1;
        option.name = name;

        cp_reset: coverpoint reset;
        cp_load: coverpoint load;
        cp_up_down: coverpoint up_down;
        cp_load_data: coverpoint load_data;

        // Cross coverage points
        cx_reset_load: cross cp_reset, cp_load;
        cx_load_up_down: cross cp_load, cp_up_down;
        cx_load_data_up_down: cross cp_load_data, cp_up_down;
    endgroup

    cg_counter cg;

    // Constructor
    function new();
        cg = new("cg_counter");
    endfunction

    // Sample the covergroup
    function void sample(bit reset, bit load, bit up_down, logic [3:0] load_data);
        cg.reset = reset;
        cg.load = load;
        cg.up_down = up_down;
        cg.load_data = load_data;
        cg.sample();
    endfunction
endclass
