class encoder_8to3_driver extends uvm_driver #(encoder_8to3_seq_item);
    `uvm_component_utils(encoder_8to3_driver)

    virtual encoder_8to3_if.v_dut intf;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            if (req != null) begin
                intf.data <= req.data;
                @(posedge intf.clk); // Wait for next clock edge
                seq_item_port.item_done();
            end
        end
    endtask

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual encoder_8to3_if.v_dut)::get(this, "", "intf", intf))
            `uvm_fatal("NO_INTF", "Cannot get interface from configuration")
    endfunction
endclass
