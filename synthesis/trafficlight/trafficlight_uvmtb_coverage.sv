import uvm_pkg::*;

class traffic_light_controller_covergroup extends uvm_object;
  covergroup state_transition_cg(string name) with function sample(bit [1:0] current_state, bit [1:0] next_state);
    option.name = name;
    option.per_instance = 1;

    state_cp: coverpoint current_state {
      bins north = {2'b00};
      bins east = {2'b01};
      bins south = {2'b10};
      bins west = {2'b11};
    }

    next_state_cp: coverpoint next_state {
      bins north = {2'b00};
      bins east = {2'b01};
      bins south = {2'b10};
      bins west = {2'b11};
    }

    state_transition: cross state_cp, next_state_cp;
  endgroup

  state_transition_cg state_transition;

  function new(string name = "traffic_light_controller_covergroup");
    super.new(name);
    state_transition = new("state_transition");
  endfunction : new

  function void sample(bit [1:0] current_state, bit [1:0] next_state);
    state_transition.sample(current_state, next_state);
  endfunction : sample

endclass : traffic_light_controller_covergroup
