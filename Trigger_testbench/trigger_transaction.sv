// Encapsulates the data passed between testbench components

`include "trigger_if.sv"

`ifndef TRIGGER_TRANS
`define TRIGGER_TRANS

class trigger_transaction;
    logic[2:0] mt_cou;
    logic[11:0] CH_trigt, CH_triga, CH_trigb;
    logic [11:0][9:0] CH_TIME_T; 
    logic [11:0][12:0] CH_ampl0;
    logic tcm_req;
    logic[1:0] tt, ta;
    
endclass

`endif