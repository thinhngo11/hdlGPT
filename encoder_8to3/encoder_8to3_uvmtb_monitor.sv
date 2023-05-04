class encoder_8to3_monitor extends uvm_monitor;
    `uvm_component_utils(encoder_8to3_monitor)

    virtual encoder_8to3_if.v_dut intf;

    uvm_analysis_port #(encoder_8to3_seq_item) item_port;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        item_port = new("item_port", this);

        if (!uvm_config_db#(virtual encoder_8to3_if.v_dut)::get(this, "", "intf", intf))
            `uvm_fatal("NO_INTF", "Cannot get interface from configuration")
    endfunction

    virtual task run_phase(uvm_phase phase);
        encoder_8to3_seq_item item;

        forever begin
            @(posedge intf.clk);
            item = encoder_8to3_seq_item::type_id::create("item");
            item.data = intf.data;
            item.encoded_data = intf.encoded_data;
            item_port.write(item);
        end
    endtask
endclass
