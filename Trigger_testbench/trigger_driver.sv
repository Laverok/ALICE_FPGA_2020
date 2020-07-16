`include "trigger_transaction.sv"

`ifndef TRIGGER_DRIVER
`define TRIGGER_DRIVER

class trigger_driver;
    virtual trigger_if vif;
    mailbox driver_mbx;
    
    function new(virtual trigger_if vif, mailbox driver_mbx);
        this.vif = vif;
        this.driver_mbx = driver_mbx;
    endfunction
    
    task run();
        forever begin
            trigger_transaction trans;
            driver_mbx.get(trans);
            
            //$display("DRIVER TRANSFER");
            
            @ (posedge vif.clk);

            vif.CH_trigt <= trans.CH_trigt;
            vif.CH_triga <= trans.CH_triga;
            vif.CH_trigb <= trans.CH_trigb;
            vif.CH_TIME_T <= trans.CH_TIME_T;
            vif.CH_ampl0 <= trans.CH_ampl0;
            
            @ (posedge vif.clk);
            
        end
        
    endtask
endclass

`endif