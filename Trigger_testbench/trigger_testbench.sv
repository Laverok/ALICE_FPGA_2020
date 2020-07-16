`timescale 1ns / 1ps

`include "trigger_test.sv"

module trigger_testbench;

    reg clk;
    trigger_if vif(clk);
    
    initial begin 
        trigger_test t;
        t = new(vif);
        t.env.vif = vif;
        t.run();
        
        clk <= 0;
    end
    
    // Clock generator
    always begin 
        #5 clk = !clk;
    end
    
    trigger tr1(
        .clk320(vif.clk),
        .mt_cou(vif.mt_cou),
        .CH_trigt(vif.CH_trigt),
        .CH_triga(vif.CH_triga),
        .CH_trigb(vif.CH_trigb),
        //.CH_TIME_T(vif.CH_TIME_T),
        //.CH_ampl0(vif.CH_ampl0),
        .tcm_req(vif.tcm_req),
        .tt(vif.tt),
        .ta(vif.ta)
    );

    
endmodule
