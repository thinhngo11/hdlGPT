class counter_sequence extends uvm_sequence #(counter_transaction);
    // Constructor
    function new(string name = "counter_sequence");
        super.new(name);
    endfunction

    // Main task
    task body();
        counter_transaction tr;

        repeat (100) begin
            tr = counter_transaction::type_id::create("tr");
            tr.reset = $urandom_range(0, 1);
            tr.load = $urandom_range(0, 1);
            tr.up_down = $urandom_range(0, 1);
            tr.load_data = $urandom_range(0, 15);
            tr.count = 4'b0;
            start_item(tr);
            finish_item(tr);
        end
    endtask
endclass
