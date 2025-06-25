
//eda link :  https://www.edaplayground.com/x/XfLr 

// ( swamy ) please copy the code but don't change/modify the code here. 

//===============================================================================================================================
// note:To the single callback hook, it is possible to have call to multiple flavors of the same method.
// i.e if the same method is implemented in multiple extended classes, then it is possible to register all the methods to the same callback hook.
// On calling of `uvm_do_callbacks macro all the callback methods executed in the order which methods are registered.
//===============================================================================================================================




//-------------------------------------------------------------------------
//						www.verificationguide.com 
//-------------------------------------------------------------------------
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