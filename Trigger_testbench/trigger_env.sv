// Composite class encapsulating the testbench

`include "trigger_driver.sv"
`include "trigger_generator.sv"

`ifndef TRIGGER_ENV
`define TRIGGER_ENV

class trigger_env;
    trigger_generator gen;
    trigger_driver drv;
    mailbox driver_mbx;
    virtual trigger_if vif;
    
    function new(virtual trigger_if vif);
        this.vif = vif;
        driver_mbx = new();
        gen = new(driver_mbx);
        drv = new(vif, driver_mbx);
    endfunction
    
    virtual task run();
        drv.vif = vif;
        
        fork
            gen.run();
            drv.run();
        join_any
     endtask
     
endclass

`endif