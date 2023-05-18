class counter_monitor extends uvm_monitor;
    // Interface
    virtual loadable_up_down_counter_if intf;

    // TLM port
    uvm_analysis_port #(counter_transaction) ap;

    // Constructor
    function new(string name = "counter_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);
    endfunction

    // Main task
    task main_phase(uvm_phase phase);
        counter_transaction tr;

        forever begin
            @(posedge intf.clk);
            tr = counter_transaction::type_id::create("tr");
            tr.reset = intf.reset;
            tr.load = intf.load;
            tr.up_down = intf.up_down;
            tr.load_data = intf.load_data;
            tr.count = intf.count;
            ap.write(tr);
        end
    endtask
endclass
