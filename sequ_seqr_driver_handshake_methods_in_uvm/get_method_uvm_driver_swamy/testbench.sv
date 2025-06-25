
// eda link :  https://edaplayground.com/x/6S4w 

// ( swamy ) please copy the code but don't change/modify the code here.

//=====================================================================================================================================
// TOPIC NAME : " get() method in uvm ".

//               i.get() method.
//=====================================================================================================================================
 
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "transaction.sv"
`include "user_sequence.sv"
`include "user_sequencer.sv"
`include "user_driver.sv"
`include "user_test.sv"


module tb;
  
  transaction trans;
  
  initial begin
    //trans = new();
//     trans = transaction::type_id::create("inst_transaction");
//     void'(trans.randomize());
//     trans.print();
    run_test("user_test");
  end
  
endmodule:tb