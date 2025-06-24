//-------------------------------------------------------------------------
//						www.verificationguide.com 
//-------------------------------------------------------------------------

// eda link : https://www.edaplayground.com/x/bzZw 

// ( swamy ) please copy the code but don't change/modify the code here. 

//=========================================================================================================================================
// Note:This example for how the implementation of the uvm callbacks in project .
// model:approach2
//  uvm_callbacks(T,CB) <handle_name>;
//  then
//  <handle_name>.add(t,cb);
  
// 	model:approach1 is diffrent 
// 	uvm_callbacks(T,CB)::add(t,cb);
	
// 	this example domenstrate the model:approach1.
//=========================================================================================================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "driver_callback.sv"
`include "driver.sv"
`include "environment.sv"
`include "basic_test.sv"

`include "user_callback.sv"
`include "user_callback_test.sv"

program testbench_top;
  
  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin//{
    run_test();
  end //}
  
endprogram