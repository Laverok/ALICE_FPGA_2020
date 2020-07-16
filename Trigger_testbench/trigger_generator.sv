`include "trigger_transaction.sv"

`ifndef TRIGGER_GEN
`define TRIGGER_GEN

class trigger_generator;

    trigger_transaction trans;
    mailbox driver_mbx;
    
    int trans_count;
    
    function new(mailbox driver_mbx);
        this.driver_mbx = driver_mbx;
    endfunction

    task run();
        
        repeat(trans_count+1) begin
            trans = new();
            
            trans.mt_cou = 0;
            trans.tcm_req = 1;
            trans.CH_trigt = 2;
            trans.CH_triga = 3;
            trans.CH_trigb = 4;
            
            driver_mbx.put(trans);

        end
    endtask

endclass

`endif