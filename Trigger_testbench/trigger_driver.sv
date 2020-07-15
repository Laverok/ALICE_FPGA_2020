`include "trigger_transaction.sv"

`ifndef TRIGGER_DRIVER
`define TRIGGER_DRIVER

class trigger_driver;
    virtual trigger_if vif;
    mailbox driver_mbx;
    
    task run();
        $display("[%0t] Driver starting", $time);
        
        @ (posedge vif.clk);
        
        forever begin
            trigger_transaction trans;
            
            $display("[%0t] Driver waiting for a transaction", $time);
            driver_mbx.get(trans);
            vif.CH_trigt <= trans.CH_trigt;
            vif.CH_triga <= trans.CH_triga;
            vif.CH_trigb <= trans.CH_trigb;
            vif.CH_TIME_T <= trans.CH_TIME_T;
            vif.CH_ampl0 <= trans.CH_ampl0;
            
        end
        
    endtask
endclass

`endif