// eda link : https://edaplayground.com/x/H4vG 

// ( swamy ) please copy the code but don't change/modify the code here.


//================================================================================================================

// TOPIC NAME  :   " TLM  FIFO "

// 1.In this example one procedure can send transactions to consumer (but consumer consume time ,that's why we used tlm fifo in between them so the procedure can put transactions in to tlm fifo and consumer get transactions based on it's requirement.

//================================================================================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "mem_seq_item.sv"
`include "producer.sv"
`include "consumer_1.sv"
`include "environment.sv"
`include "test.sv"



module tb_tlm_analysis_fifo_ex;
  
  
  initial begin
    run_test("test");
  end
endmodule:tb_tlm_analysis_fifo_ex