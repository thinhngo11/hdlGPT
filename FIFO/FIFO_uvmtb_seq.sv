`include "fifo_pkg.sv"

class fifo_sequence extends uvm_sequence #(fifo_transaction);
    `uvm_object_utils(fifo_sequence)

    function new(string name = "fifo_sequence");
        super.new(name);
    endfunction

    virtual task body();
        fifo_transaction trans;

        repeat(10) begin
            trans = fifo_transaction::type_id::create("trans");
            assert(trans.randomize());
            trans.trans_type = fifo_trans_type_e.WRITE;
            start_item(trans);
            finish_item(trans);
        end

        repeat(10) begin
            trans = fifo_transaction::type_id::create("trans");
            trans.trans_type = fifo_trans_type_e.READ;
            start_item(trans);
            finish_item(trans);
        end
    endtask
endclass
