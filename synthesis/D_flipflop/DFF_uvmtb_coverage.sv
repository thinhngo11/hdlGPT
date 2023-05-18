// dff_coverage_collector.sv
class dff_coverage_collector extends uvm_subscriber #(dff_seq_item);
  `uvm_component_utils(dff_coverage_collector)

  covergroup input_cg @(posedge clk);
    option.per_instance = 1;
    option.auto_bin_max = 2;

    input_cp: coverpoint d {
      bins input_values[] = {0, 1};
    }
  endgroup

  covergroup output_cg @(posedge clk);
    option.per_instance = 1;
    option.auto_bin_max = 2;

    output_cp: coverpoint q {
      bins output_values[] = {0, 1};
    }
  endgroup

  function new(string name = "dff_coverage_collector", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void write(dff_seq_item t);
    input_cg.sample();
    output_cg.sample();
  endfunction
endclass
```

2. Instantiate and connect the coverage collector to the monitor's analysis port:

In the agent or environment, depending on your testbench hierarchy, instantiate the coverage collector and connect it to the monitor's analysis port.

```systemverilog
dff_coverage_collector coverage_collector;

function void build_phase(uvm_phase phase);
  super.build_phase(phase);

  coverage_collector = dff_coverage_collector::type_id::create("coverage_collector", this);
  monitor.ap.connect(coverage_collector.analysis_export);
endfunction
```

3. Report coverage at the end of the simulation:

In the environment or top-level testbench, report coverage at the end of the simulation by calling the `report_coverage()` method.

```systemverilog
function void report_phase(uvm_phase phase);
  super.report_phase(phase);
  $display("Coverage Results:\n");
  coverage_collector.input_cg.report();
  coverage_collector.output_cg.report();
endfunction
