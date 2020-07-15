`timescale 1ns/1ps
module up_counter_tb;
    
    reg clk, enable, reset;
    wire[7:0] out;
    
    reg[7:0] prev_out;
    
    int tests_done = 0;
    int tests_passed = 0;
    
    up_counter U0 (
    .out(out),
    .enable(enable),
    .clk(clk),
    .reset(reset)
    );
    
    task test;
        begin 
            tests_done++;
            $display("[%t], enable = %d, reset = %d, prev_out = %d, out = %d", $time, enable, reset, prev_out, out);
            if((reset == 1 && out == 0) || (reset == 0 && enable == 1 && out == prev_out + 1) || (reset == 0 && enable == 0 && out == prev_out)) begin
                tests_passed++;
                $display("PASSED");
            end else
                $display("FAILED");        
        end
    endtask
        
    initial begin
        $display ("SIMULATION RUNNING");
        $timeformat(-9, 0, "ns", 1);
        clk = 0;
        enable = 0;
        reset = 1;
        
        #15 reset = 0;
        #20 enable = 1;
        #100 reset = 1;
        #20 reset = 0;
        #20 enable = 0;
        #40 enable = 1;
        #3000 $display("SIMULATION FINISHED, Tests passed: [%d/%d]", tests_passed, tests_done);
        $finish();
    end
    
    always begin
        #5 clk = !clk;
    end
    
    always @ (posedge clk) begin
        test();
        prev_out = out;
    end
    
endmodule
