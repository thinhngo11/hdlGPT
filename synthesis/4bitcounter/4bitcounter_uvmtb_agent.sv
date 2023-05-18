class counter_agent extends uvm_agent;
    // TLM port
    uvm_analysis_port #(counter_transaction) ap;

    // Components
    counter_driver driver;
    counter_monitor monitor;

    // Constructor
    function new(string name = "counter_agent", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);
        driver = counter_driver::type_id::create("driver", this);
        monitor = counter_monitor::type_id::create("monitor", this);
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        monitor.ap.connect(ap);
    endfunction

    // Main phase
    task main_phase(uvm_phase phase);
        driver.run(phase);
    endtask
endclass
