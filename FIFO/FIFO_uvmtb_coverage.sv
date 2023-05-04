`include "fifo_pkg.sv"

class fifo_covergroup extends uvm_object;
    covergroup fifo_cg (fifo_trans_type_e trans_type, bit [7:0] data) with function sample(fifo_trans_type_e, bit [7:0]);
        option.per_instance = 1;
        option.name = "fifo_cg";

        cp_trans_type: coverpoint trans_type {
            bins write = {fifo_trans_type_e.WRITE};
            bins read = {fifo_trans_type_e.READ};
        }

        cp_data: coverpoint data {
            bins data_ranges[] = {8'h01, 8'h40, 8'h80, 8'hFF};
        }

        cr_trans_data: cross cp_trans_type, cp_data;
    endgroup

    function new(string name = "fifo_covergroup");
        super.new(name);
    endfunction

    function void sample_trans(fifo_transaction trans);
        fifo_cg.sample(trans.trans_type, trans.data);
    endfunction
endclass
