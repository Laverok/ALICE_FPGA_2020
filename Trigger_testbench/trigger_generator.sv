// Responsible for generating the signals and sending them to the driver

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
            
            trans.mt_cou = 1;
            trans.tcm_req = 1;
            trans.CH_trigt = 2;
            trans.CH_triga = 3;
            trans.CH_trigb = 4;
            trans.CH_TIME_T = '{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
            trans.CH_ampl0 = '{101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112} ;
            driver_mbx.put(trans);

        end
    endtask

endclass

`endif