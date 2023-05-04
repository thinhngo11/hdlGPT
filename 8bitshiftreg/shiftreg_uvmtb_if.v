`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

// Define interface
interface loadable_shift_register_if(input logic clk);
    logic reset;
    logic load;
    logic [7:0] data_in;
    logic shift_in;
    logic [7:0] data_out;
endinterface
