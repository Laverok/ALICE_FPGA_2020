`include "trigger_driver.sv"

`ifndef TRIGGER_ENV
`define TRIGGER_ENV

class trigger_env;
    trigger_driver d;
    //trigger_monitor m;
    //trigger_scoreboard s;
    mailbox env_mbx;
    virtual trigger_if vif;
    
    function new();
        d = new;
        //m = new;
        //s = new;
        env_mbx = new();
    endfunction
    
    virtual task run();
        d.vif = vif;
        //m.vif = vif;
        //s.vif = vif;
        //m.monitor_mbx = env_mbx;
        //s.scb_mbx = env_mbx;
        
        fork
            d.run();
            //s.run();
            //m.run();
        join_any
     endtask
     
endclass

`endif