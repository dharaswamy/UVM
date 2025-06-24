
// ( swamy ) please copy the code but don't change/modify the code here.


//=========================================================================================================================
//                                 Topic Name : TLM PORTS

//                I. PROCEDURE PUT THE TRANSACTIONS ( here the procedure is' component_a' and consumere is ' component_b ' ) 
							 
// 	               Used ports : uvm_blocking_put_port and uvm_blocking_put_imp
							 
// 				   This is the blocking mechanism put() method.
							 
//=========================================================================================================================




`include "uvm_macros.svh"
import uvm_pkg::*;

`include "mem_sequence_item.sv"
`include "component_a.sv"
`include "component_b.sv"
`include "environment.sv"
`include "test.sv"

module tb_push_mode_tlm;
  
  initial begin
    run_test("test");
  end
endmodule:tb_push_mode_tlm