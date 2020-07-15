`include "trigger_if.sv"

`ifndef TRIGGER_TRANS
`define TRIGGER_TRANS

class trigger_transaction;
    logic[2:0] mt_cou;
    logic[11:0] CH_trigt, CH_triga, CH_trigb;
    trig_time CH_TIME_T; 
    trig_ampl0 CH_ampl0;
    logic tcm_req;
    logic[1:0] tt, ta;
    
    function void print();
    //TODO
    endfunction
    
endclass

`endif