// Scoreboard
class loadable_shift_register_scoreboard extends uvm_subscriber #(loadable_shift_register_item);
    `uvm_component_utils(loadable_shift_register_scoreboard)

    int num_items_received;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        num_items_received = 0;
    endfunction

    virtual function void write(loadable_shift_register_item t);
        if (t.reset) begin
            num_items_received = 0;
        end else if (t.load) begin
            num_items_received++;
        end else begin
            num_items_received++;
            if (num_items_received > 8) begin
                `uvm_info(get_type_name(), $sformatf("Expected data_out: 0x%0h, Actual data_out: 0x%0h", {t.data_in[6:0], t.shift_in}, t.data_out), UVM_LOW)
            end
        end
    endfunction
endclass
