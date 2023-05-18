class loadable_shift_register_cover_group extends uvm_object;
    `uvm_object_utils(loadable_shift_register_cover_group)

    covergroup cg_loadable_shift_register;
        option.per_instance = 1;
        option.name = "cg_loadable_shift_register";

        cp_reset: coverpoint reset;
        cp_load: coverpoint load;
        cp_data_in: coverpoint data_in {
            bins low = {8'b0};
            bins mid = {8'b10000000};
            bins high = {8'b11111111};
        }
        cp_shift_in: coverpoint shift_in;
        cp_data_out: coverpoint data_out {
            bins low = {8'b0};
            bins mid = {8'b10000000};
            bins high = {8'b11111111};
        }

        // Cross coverage
        cx_reset_load: cross cp_reset, cp_load;
    endgroup

    function new(string name = "loadable_shift_register_cover_group");
        super.new(name);
        cg_loadable_shift_register = new();
    endfunction

    function void sample(bit reset, bit load, bit [7:0] data_in, bit shift_in, bit [7:0] data_out);
        cg_loadable_shift_register.reset = reset;
        cg_loadable_shift_register.load = load;
        cg_loadable_shift_register.data_in = data_in;
        cg_loadable_shift_register.shift_in = shift_in;
        cg_loadable_shift_register.data_out = data_out;
        cg_loadable_shift_register.sample();
    endfunction
endclass
