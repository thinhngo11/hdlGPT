class d_flip_flop_monitor extends uvm_monitor;
    `uvm_component_utils(d_flip_flop_monitor)

    virtual d_flip_flop_if.dut intf;

    uvm_analysis_port #(d_flip_flop_seq_item) item_port;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        item_port = new("item_port", this);

        if (!uvm_config_db#(virtual d_flip_flop_if.dut)::get(this, "", "intf", intf))
            `uvm_fatal("NO_INTF", "Cannot get interface from configuration")
    endfunction

    virtual task run_phase(uvm_phase phase);
        d_flip_flop_seq_item item;

        forever begin
            @(posedge intf.clk);
            item = d_flip_flop_seq_item::type_id::create("item");
            item.D = intf.D;
            item.RST = intf.RST;
            item_port.write(item);
        end
    endtask
endclass
