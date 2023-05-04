`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

// Update loadable_shift_register_if interface
interface loadable_shift_register_if(input logic clk);
    logic reset;
    logic load;
    logic [7:0] data_in;
    logic shift_in;
    logic [7:0] data_out;
    logic [7:0] prev_data_out;

    // Assertion #1: When reset is high, data_out should be 0.
    property p_reset;
        @(posedge clk)
        reset |-> data_out === 8'b0;
    endproperty
    a_reset : assert property(p_reset);

    // Assertion #2: When load is high, data_out should be updated to data_in on the next clock cycle.
    property p_load;
        @(posedge clk)
        load |=> data_out === data_in;
    endproperty
    a_load : assert property(p_load);

    // Assertion #3: When load is low, data_out should be shifted right with shift_in as msb on the next clock cycle.
    property p_shift;
        @(posedge clk)
        (!load) |=> data_out === {shift_in, prev_data_out[7:1]};
    endproperty
    a_shift : assert property(p_shift);

    // Update prev_data_out at every clock cycle
    always @(posedge clk) begin
        prev_data_out <= data_out;
    end
        
    // Cover Assertions

    // Cover #1: When reset is high, data_out should be 0.
    property cp_reset;
        @(posedge clk)
        reset |-> data_out === 8'b0;
    endproperty
    c_reset : cover property(cp_reset);

    // Cover #2: When load is high, data_out should be updated to data_in on the next clock cycle.
    property cp_load;
        @(posedge clk)
        load |=> data_out === data_in;
    endproperty
    c_load : cover property(cp_load);

    // Cover #3: When load is low, data_out should be shifted right with shift_in as msb on the next clock cycle.
    property cp_shift;
        @(posedge clk)
        (!load) |=> data_out === {shift_in, prev_data_out[7:1]};
    endproperty
    c_shift : cover property(cp_shift);
        
endinterface
