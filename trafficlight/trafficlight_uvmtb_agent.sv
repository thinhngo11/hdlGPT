import uvm_pkg::*;

class traffic_light_controller_agent extends uvm_agent;

  traffic_light_controller_if intf;
  traffic_light_controller_covergroup m_cov;  

  function new(string name = "traffic_light_controller_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual traffic_light_controller_if)::get(this, "", "intf", intf))
    `uvm_fatal(get_type_name(), "Failed to get traffic_light_controller_if from config_db")

    m_cov = new("m_cov");
    m_drv = traffic_light_controller_driver::type_id::create("m_drv", this);
    m_seqr = uvm_sequencer#(traffic_light_controller_seq_item)::type_id::create("m_seqr", this);
    m_mon = traffic_light_controller_monitor::type_id::create("m_mon", this);
    m_scb = traffic_light_controller_scoreboard::type_id::create("m_scb", this);
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    traffic_light_controller_base_sequence seq = new("traffic_light_controller_random_sequence");
    seq.start(m_seqr);

    // Sample coverage
    bit [1:0] prev_state = 2'b00;
    forever begin
      @(intf.clk.posedge);
      m_cov.sample(prev_state, intf.north_south);
      prev_state = intf.north_south;
    end
  endtask : run_phase
  
  virtual task apply_reset();
    forever begin
      #10 intf.reset <= 1'b1;
      #20 intf.reset <= 1'b0;
    end
  endtask : apply_reset

endclass : traffic_light_controller_agent
