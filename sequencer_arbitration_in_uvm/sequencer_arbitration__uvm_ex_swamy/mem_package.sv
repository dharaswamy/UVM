
//---------------------------------------------------------------------
// package : mem_package 
//---------------------------------------------------------------------

package mem_package;

//---------------------------------------------------------------------
// importign the uvm_pkg : uvm_pkg  (implicit import)
//---------------------------------------------------------------------
import uvm_pkg::*;


//----------------------------------------------------------------------
//  including the files
//----------------------------------------------------------------------

`include "mem_seq_item.sv"
`include "mem_sequence.sv"
`include "mem_sequencer.sv"
`include "mem_driver.sv"
`include "mem_agent.sv"
`include "mem_environment.sv"
`include "mem_test_base.sv"
`include "mem_test_1.sv"
`include "mem_test_2.sv"



endpackage:mem_package