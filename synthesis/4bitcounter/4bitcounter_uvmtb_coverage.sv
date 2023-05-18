1. Create a coverage class:

```systemverilog
class counter_coverage;
    // Covergroup
    covergroup cg_counter(string name) @(posedge clk);
        option.per_instance = 1;
        option.name = name;

        cp_reset: coverpoint reset;
        cp_load: coverpoint load;
        cp_up_down: coverpoint up_down;
        cp_load_data: coverpoint load_data;

        // Cross coverage points
        cx_reset_load: cross cp_reset, cp_load;
        cx_load_up_down: cross cp_load, cp_up_down;
        cx_load_data_up_down: cross cp_load_data, cp_up_down;
    endgroup

    cg_counter cg;

    // Constructor
    function new();
        cg = new("cg_counter");
    endfunction

    // Sample the covergroup
    function void sample(bit reset, bit load, bit up_down, logic [3:0] load_data);
        cg.reset = reset;
        cg.load = load;
        cg.up_down = up_down;
        cg.load_data = load_data;
        cg.sample();
    endfunction
endclass
```

2. Instantiate the coverage class in the `counter_monitor`:

```systemverilog
class counter_monitor extends uvm_monitor;
    // ...

    // Coverage instance
    counter_coverage coverage;

    // Constructor
    function new(string name = "counter_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        ap = new("ap", this);
        coverage = new();
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

            // Sample coverage
            coverage.sample(tr.reset, tr.load, tr.up_down, tr.load_data);

            ap.write(tr);
        end
    endtask
endclass
```

3. Add a coverage callback in the `counter_test`:

```systemverilog
class counter_test extends uvm_test;
    // ...

    // Main phase
    task main_phase(uvm_phase phase);
        // ...

        // Register for end_of_simulation_phase callback
        phase.phase_done.set_end_of_simulation_phase(end_of_simulation_phase);
    endtask

    // End of simulation phase
    function void end_of_simulation_phase(uvm_phase phase);
        // Print coverage report
        $display("Coverage Report:");
        $display("[COVERAGE] %s", env.agent.monitor.coverage.cg.get_coverage_report());
    endfunction
endclass
