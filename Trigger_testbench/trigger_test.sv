`include "trigger_driver.sv"
`include "trigger_env.sv"

`ifndef TRIGGER_TEST
`define TRIGGER_TEST

program trigger_test(trigger_if vif);
    trigger_env env;
    
    initial begin
        env = new(vif);
        env.gen.trans_count = 10; // how many times the generator should apply stimulus
        
        env.run();
    end    
endprogram

`endif