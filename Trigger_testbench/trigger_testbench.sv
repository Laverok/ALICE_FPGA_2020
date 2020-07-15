`timescale 1ns / 1ps

`include "trigger_test.sv"

module trigger_testbench;

    reg clk;
    trigger_if tif(clk);
    
    initial begin 
        trigger_test t;
        t = new;
        t.e.vif = tif;
        t.run();
        
        clk <= 0;
    end
    
    // Clock generator
    always begin 
        #5 clk = !clk;
    end
    
    trigger tr1(
        .clk320(tif.clk),
        .mt_cou(tif.mt_cou),
        .CH_trigt(tif.CH_trigt),
        .CH_triga(tif.CH_triga),
        .CH_trigb(tif.CH_trigb),
        .CH_TIME_T(tif.CH_TIME_T),
        .CH_ampl0(tif.CH_ampl0),
        .tcm_req(tif.tcm_req),
        .tt(tif.tt),
        .ta(tif.ta)
    );

    
endmodule
