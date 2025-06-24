// EDa link : https://edaplayground.com/x/iiev 

// ( swamy ) please copy the code but don't change/modify the code here.

//============================================================================================================================
// Note:This example for how the implementation of the uvm callbacks in project .
// this model:approach2
//  uvm_callbacks(T,CB) <handle_name>;
//  then
//  <handle_name>.add(t,cb);
  
// 	model:approach1 is diffrent 
// 	uvm_callbacks(T,CB)::add(t,cb);
	
// 	this example domenstrate the model:approach2.
//============================================================================================================================


`include "uvm_macros.svh"
  import uvm_pkg::*;
 
`include "my_seq_item.sv"
`include "my_seq.sv"
`include "my_sequencer.sv"
`include "driver_cb.sv"
`include "my_dri_cb.sv"
`include "my_driver.sv"

`include "my_test.sv"
module top();
  
  initial
  begin
    run_test("my_test");
  end
endmodule : top
