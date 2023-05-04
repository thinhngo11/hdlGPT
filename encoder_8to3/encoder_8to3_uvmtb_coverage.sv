// Add this coverage class to encoder_8to3_pkg.sv
class encoder_8to3_coverage extends uvm_subscriber #(encoder_8to3_seq_item);
    `uvm_component_utils(encoder_8to3_coverage)

    covergroup encoder_cov_cg @(posedge vif.clk);
        option.per_instance = 1;
        option.name = "encoder_cov_cg";

        data_cp: coverpoint vif.data {
            option.auto_bin_max = 8;
        }

        encoded_data_cp: coverpoint vif.encoded_data {
            option.auto_bin_max = 3;
        }

        input_output_cross: cross data_cp, encoded_data_cp;
    endgroup

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        encoder_cov_cg = new();
    endfunction

    virtual function void write(encoder_8to3_seq_item t);
        encoder_cov_cg.sample();
    endfunction
endclass
