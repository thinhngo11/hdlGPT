class d_flip_flop_driver extends uvm_driver #(d_flip_flop_seq_item);
    `uvm_component_utils(d_flip_flop_driver)

    virtual d_flip_flop_if.dut intf;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            if (req != null) begin
                intf.D <= req.D;
                intf.RST <= req.RST;
                @(posedge intf.clk); // Wait for next clock edge
                seq_item_port.item_done();
            end
        end
    endtask

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual d_flip_flop_if.dut)::get(this, "", "intf", intf))
            `uvm_fatal("NO_INTF", "Cannot get interface from configuration")
    endfunction
endclass
