class traffic_light_controller_monitor extends uvm_monitor;
  virtual traffic_light_controller_if intf;

  function new(string name = "traffic_light_controller_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual task run_phase(uvm_phase phase);
    forever begin
      @(intf.clk.posedge);
      $display("Time: %0dns | North_South: %2b | East_West: %2b", $time, intf.north_south, intf.east_west);
    end
  endtask : run_phase

endclass : traffic_light_controller_monitor
