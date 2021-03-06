// Top module of the testbench

`timescale 1ns / 1ps

`include "trigger_test.sv"

module trigger_testbench;

    bit clk;
    
    // Clock generator
    always begin 
        #5 clk = !clk;
    end
    
    initial begin 
        clk <= 0;
    end
    
    // Type conversion so that the VHDL trigger module can be instantiated without the type problems
    logic [(12*10-1):0] v_CH_TIME_T;
    logic [(12*13-1):0] v_CH_ampl0;
    
    assign v_CH_TIME_T = _if.CH_TIME_T;
    assign v_CH_ampl0 = _if.CH_ampl0;
    
    // Trigger interface instantiation
    trigger_if _if(clk);
    
    // Test class instantiation
    trigger_test test(_if);
    
    // DUT
    trigger_wrapper tr1(
        .clk320(_if.clk),
        .mt_cou(_if.mt_cou),
        .CH_trigt(_if.CH_trigt),
        .CH_triga(_if.CH_triga),
        .CH_trigb(_if.CH_trigb),
        .CH_TIME_T(v_CH_TIME_T),
        .CH_ampl0(v_CH_ampl0),
        .tcm_req(_if.tcm_req),
        .tt(_if.tt),
        .ta(_if.ta)
    );
    
endmodule
