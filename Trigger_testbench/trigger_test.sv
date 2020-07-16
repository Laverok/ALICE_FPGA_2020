`include "trigger_driver.sv"
`include "trigger_env.sv"

`ifndef TRIGGER_TEST
`define TRIGGER_TEST

class trigger_test;
    trigger_env env;
    mailbox driver_mbx;
    virtual trigger_if vif;
    
    function new(virtual trigger_if vif);
        this.vif = vif;
        driver_mbx = new();
        env = new(vif);
    endfunction
    
    virtual task run();
        env.d.driver_mbx = driver_mbx;
        
        fork
            env.run();
        join_none
        
        apply_stimulus();
    endtask
    
    virtual task apply_stimulus();
        trigger_transaction trans;
        trans = new();
        
        $display ("[%0t] Applying stimulus", $time);
        trans.mt_cou = 0;
        trans.tcm_req = 0;
        trans.CH_trigt = 2;
        trans.CH_triga = 3;
        trans.CH_trigb = 4;
        
        driver_mbx.put(trans);
        
    endtask
    
endclass

`endif