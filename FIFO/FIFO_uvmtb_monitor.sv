`include "fifo_pkg.sv"

class fifo_monitor extends uvm_monitor;
    `uvm_component_utils(fifo_monitor)

    virtual interface fifo_if vif;
    uvm_analysis_port #(fifo_transaction) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        fifo_transaction trans = new();

        forever begin
            @(posedge vif.clk);

            if (vif.wr_en) begin
                trans.trans_type = fifo_trans_type_e.WRITE;
                trans.data = vif.wr_data;
                ap.write(trans);
            end

            if (vif.rd_en && !vif.empty) begin
                trans.trans_type = fifo_trans_type_e.READ;
                trans.data = vif.rd_data;
                ap.write(trans);
            end
        end
    endtask
endclass
