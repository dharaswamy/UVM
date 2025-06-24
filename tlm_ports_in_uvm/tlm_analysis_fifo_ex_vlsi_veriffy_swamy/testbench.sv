 
// Eda link : https://edaplayground.com/x/uGNg  

// ( swamy ) please copy the code but don't change/modify the code here.


//============================================================================================================================
// TOPIC NAME  :   " TLM ANALYSIS FIFO "

// 1.In this example one procedure can broad cast transactions to tlm analysis fifos ( consumer classes have  tlm analysis fifo s) .
                 
//============================================================================================================================


`include "uvm_macros.svh"
import uvm_pkg::*;

`include "mem_seq_item.sv"
`include "producer.sv"
`include "consumer_1.sv"
`include "consumer_2.sv"
`include "consumer_3.sv"
`include "consumer_4.sv"
`include "environment.sv"
`include "test.sv"



module tb_tlm_analysis_fifo_ex;
  
  
  initial begin
    run_test("test");
  end
endmodule:tb_tlm_analysis_fifo_ex