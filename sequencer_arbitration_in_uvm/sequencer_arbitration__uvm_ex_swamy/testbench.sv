// Eda link :  https://edaplayground.com/x/LzhQ 

// ( swamy ) please copy the code but don't change/modify the code here.



//=======================================================================================================================
// TOPIC NAME : SEQUENCER ARBITRATION MECHANISM  ,ref : cluelogic.
             
// The uvm sequecer have six 6 arbitration mechanism for granted access to the sequences.

// 1. UVM_SEQ_ARB_FIFO       2.UVM_SEQ_ARB_RANDOM         3. UVM_SEQ_ARB_STRIC_FIFO  
// 4.UVM_SEQ_ARB_STRICT_FIFO 5.UVM_SEQ_ARB_STRICT_RANDOM

//=======================================================================================================================

`include "uvm_macros.svh"
import uvm_pkg::*;


`include "mem_package.sv"
import mem_package::*;


module tb;
  
  initial begin
    run_test("mem_test_1");
  end
  
  
endmodule:tb