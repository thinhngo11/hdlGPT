`include "fifo_pkg.sv"

class fifo_driver extends uvm_driver #(fifo_transaction);
    `uvm_component_utils(fifo_driver)

    virtual interface fifo_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        fifo_transaction trans;

        fork
            forever begin
                seq_item_port.get_next_item(trans);
                case (trans.trans_type)
                    fifo_trans_type_e.WRITE: begin
                        vif.wr_en <= 1;
                        vif.wr_data <= trans.data;
                        @(posedge vif.clk);
                        vif.wr_en <= 0;
                    end
                    fifo_trans_type_e.READ: begin
                        vif.rd_en <= 1;
                        @(posedge vif.clk);
                        vif.rd_en <= 0;
                    end
                endcase
                seq_item_port.item_done();
            end
        join_none
    endtask
endclass
