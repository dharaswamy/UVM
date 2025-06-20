
// Eda link : https://edaplayground.com/x/PdTr  


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
File Name : transaction.sv 

//-------------------------------------------------------------------
// Class Name : transaction , Base transaction class.
//-------------------------------------------------------------------

class transaction extends uvm_sequence_item;
  
  rand bit [7:0]  paddr;
  rand bit [7:0]  pdata;
  
  function new(string name = " transaction ");
    super.new(name);  
  endfunction:new
  
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(paddr,UVM_ALL_ON +UVM_DEC)
  `uvm_field_int(pdata,UVM_ALL_ON +UVM_DEC)
  `uvm_object_utils_end
  
endclass:transaction



//-------------------------------------------------------------------
//  // Class Name : low_addr_transaction ,for generating the low paddr values 
//-------------------------------------------------------------------

class low_paddr_transaction  extends transaction;
  
  constraint  paddr_low_consrt{  paddr < 11 ; }
  
  `uvm_object_utils(low_paddr_transaction)
  
  function new(string name = "low_paddr_transaction");
    super.new(name);
  endfunction:new
  
endclass:low_paddr_transaction

//-------------------------------------------------------------------
// Class Name : medium_paddr_transaction ,for generating the medium paddr values 
//-------------------------------------------------------------------

class medium_paddr_transaction  extends transaction;
  
  constraint  paddr_medium_consrt{ paddr < 100 ; paddr > 10 ;}
  
  `uvm_object_utils(medium_paddr_transaction)
  
  function new(string name = "medium_paddr_transaction");
    super.new(name);
  endfunction:new
  
endclass:medium_paddr_transaction

//-------------------------------------------------------------------
//// Class Name : high_addr_transaction ,for generating the high paddr values 
//-------------------------------------------------------------------

class high_paddr_transaction  extends transaction;
  
  constraint  paddr_high_consrt{ paddr > 100 ; }
  
  `uvm_object_utils(high_paddr_transaction)
  
  function new(string name = "high_paddr_transaction");
    super.new(name);
  endfunction:new
  
endclass:high_paddr_transaction

//-------------------------------------------------------------------
//
//-------------------------------------------------------------------


//===========================================================================================================================================================


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
// File Name : test_base.sv 



class test_base extends uvm_test;
  
  transaction trans;
  
    //-------------------------------------------------------------------------------
   // Factory registration : using utlity macros.
   //------------------------------------------------------------------------------
  `uvm_component_utils(test_base)
  
  
    //-------------------------------------------------------------------------------
    // Function : new(),default constructor
   //------------------------------------------------------------------------------
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
    //-------------------------------------------------------------------------------
   //   Function : build_phase
   //------------------------------------------------------------------------------
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
  endfunction:build_phase
  
   //-------------------------------------------------------------------------------
   // Function user defined : factory_override 
   //------------------------------------------------------------------------------
  
  virtual function void factory_override();
    trans = transaction::type_id::create("trans");
      //repeat(10) begin
      void'(trans.randomize());
      trans.print();
      // end
  endfunction:factory_override
  
  //-------------------------------------------------------------------------------
  // Task : run_phase()
   //------------------------------------------------------------------------------
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    //-------------------------------------------------------------------------------
    //  Randomizing the tranaction class : it generates random values of paddr,pdata.
    //------------------------------------------------------------------------------
    `uvm_info(" RANDOMIZATION " ," BEFORE FACTORY OVERRIDE ",UVM_NONE)
    repeat(10) begin
      factory_override();
     end
  
       
     //----------------------------------------------------------------------------------------
     //  Factory override : override type : low_paddr_transaction ,so it generates the random values
     //   of paddr  < 11.
     //-----------------------------------------------------------------------------------------
    
     set_type_override_by_type(transaction::get_type(),low_paddr_transaction::get_type());
    `uvm_info(" RANODIZATION "," AFTER THE FACTORY OVERRIDE transaction to \"low_paddr_transaction\"",UVM_NONE)
     repeat(10) begin
       factory_override();
       if(trans.paddr > 10) begin
         `uvm_error(" LOW PADDR ERROR ",$sformatf(" GENERATED paddr =%0d ",trans.paddr))
      end
     end
    
      //-----------------------------------------------------------------------------------------
      // Factory override : override type : medium_paddr_transaction ,so it generates the random values
      //   of paddr < 100 ; paddr > 10 ;
      //------------------------------------------------------------------------------------------
       
      set_type_override_by_type(transaction::get_type(),medium_paddr_transaction::get_type());
     `uvm_info(" RANODIZATION "," AFTER THE FACTORY OVERRIDE transaction to \"medium_paddr_transaction\"",UVM_NONE)
       repeat(10) begin
       factory_override();
       if(trans.paddr < 10 && trans.paddr > 100 ) begin
         `uvm_error(" MEDIUM PADDR ERROR ",$sformatf(" GENERATED paddr =%0d ",trans.paddr))
      end
      end
       
     //---------------------------------------------------------------------------------------------
     // Factory override : override type : low_paddr_transaction ,so it generates the random values
     //   of paddr > 100 .
     //-----------------------------------------------------------------------------------------------
         
     set_type_override_by_type(transaction::get_type(),high_paddr_transaction::get_type());
    `uvm_info("RANODIZATION "," AFTER THE FACTORY OVERRIDE transaction to \"high_paddr_transaction\"",UVM_NONE)
    repeat(10) begin
     factory_override();
      if(trans.paddr < 100) begin
        `uvm_error(" HIGH PADDR  ERROR ",$sformatf(" GENERATED paddr =%0d ",trans.paddr))
      end
     end
     
  endtask:run_phase
  
endclass:test_base

//===========================================================================================================================================================


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
File Name : testbench.sv


`include "uvm_macros.svh"
import uvm_pkg::*;

`include "transaction.sv"
`include "test_base.sv"


module tb;
  
//   initial begin
//    transaction trans;
//     set_type_override_by_type(transaction::get_type(),low_paddr_transaction::get_type());
//     trans = transaction::type_id::create("trans");
//     repeat(10) begin
//     void'(trans.randomize());
//     trans.print();
//     end
//   end
  
  initial begin 
    run_test("test_base");
  end
  
endmodule:tb



//===========================================================================================================================================================




//-----------------------------------------------------------------------------------------------------------------------------------------------------------

//===========================================================================================================================================================




//-----------------------------------------------------------------------------------------------------------------------------------------------------------

//===========================================================================================================================================================



//=========================================================================================================================================================================================================================

//-----------------------------------------------------------------------------------------------------------------------------------------------------------

//===========================================================================================================================================================
