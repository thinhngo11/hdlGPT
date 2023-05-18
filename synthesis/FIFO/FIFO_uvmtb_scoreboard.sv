`include "fifo_pkg.sv"

class fifo_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(fifo_scoreboard)

    uvm_tlm_analysis_fifo #(fifo_transaction) fifo_fifo;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        fifo_fifo = new("fifo_fifo", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        fifo_transaction::type_id::set_compare(uvm_compare::type_id);
    endfunction

    virtual task run_phase(uvm_phase phase);
        fifo_transaction trans;

        forever begin
            fifo_fifo.get(trans);
            case (trans.trans_type)
                fifo_trans_type_e.WRITE: $display("WRITE: %0h", trans.data);
                fifo_trans_type_e.READ: $display("READ: %0h", trans.data);
                default: $error("Invalid transaction type");
            endcase
        end
    endtask
endclass
