class counter_driver extends uvm_driver #(counter_transaction);
    // Interface
    virtual loadable_up_down_counter_if intf;

    // Constructor
    function new(string name = "counter_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Main task
    task drive();
        forever begin
            seq_item_port.get_next_item(req);
            if (req.reset) begin
                intf.reset <= 1;
            end else begin
                intf.reset <= 0;
                intf.load <= req.load;
                intf.up_down <= req.up_down;
                intf.load_data <= req.load_data;
            end
            seq_item_port.item_done();
        end
    endtask
endclass
