`include "trigger_driver.sv"

`ifndef TRIGGER_ENV
`define TRIGGER_ENV

class trigger_env;
    trigger_driver d;
    //trigger_monitor m;
    //trigger_scoreboard s;
    mailbox driver_mbx;
    virtual trigger_if vif;
    
    function new(virtual trigger_if vif);
        this.vif = vif;
        driver_mbx = new();
        d = new(vif, driver_mbx);
        //m = new;
        //s = new;
    endfunction
    
    virtual task run();
        d.vif = vif;
        //m.vif = vif;
        //s.vif = vif;
        
        fork
            d.run();
            //s.run();
            //m.run();
        join_any
     endtask
     
endclass

`endif