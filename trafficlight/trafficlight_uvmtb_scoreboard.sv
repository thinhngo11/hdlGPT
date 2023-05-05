class traffic_light_controller_scoreboard extends uvm_scoreboard;
  function new(string name = "traffic_light_controller_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new
endclass : traffic_light_controller_scoreboard

// Update the traffic_light_controller_agent class
class traffic_light_controller_agent extends uvm_agent;
  // Add the following properties
  traffic_light_controller_driver m_drv;
  uvm_sequencer#(traffic_light_controller_seq_item) m_seqr;
  traffic_light_controller_monitor m_mon;
  traffic_light_controller_scoreboard m_scb;

  // Update the build_phase function
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual traffic_light_controller_if)::get(this, "", "intf", intf))
      `uvm_fatal(get_type_name(), "Failed to get traffic_light_controller_if from config_db")

    m_drv = traffic_light_controller_driver::type_id::create("m_drv", this);
    m_seqr = uvm_sequencer#(traffic_light_controller_seq_item)::type_id::create("m_seqr", this);
    m_mon = traffic_light_controller_monitor::type_id::create("m_mon", this);
    m_scb = traffic_light_controller_scoreboard::type_id::create("m_scb", this);
  endfunction : build_phase

  // Update the run_phase function
  virtual task run_phase(uvm_phase phase);
    traffic_light_controller_base_sequence seq = new("traffic_light_controller_random_sequence");
    seq.start(m_seqr);
  endtask : run_phase

endclass : traffic_light_controller_agent
