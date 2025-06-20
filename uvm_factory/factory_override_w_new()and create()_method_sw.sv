
// Eda link : https://edaplayground.com/x/FpM9 


// ( swamy ) please copy the code but don't change/modify the code here.

//========================================================================================
//                 Factory override concept                                                 
//                i.Global override/type override                                         
//                ii.instance override                                                    
//========================================================================================

`include "uvm_macros.svh"
 import uvm_pkg::*;

//----------------------------------------------------------------------------------------
//Ex: for factory override from youtube:munsif basic example for difference between the new() and create() methods ,of you create the object with new() constructor the factory override concepts are not works.


class seq_item_1 extends uvm_sequence_item;
  
  rand bit[7:0] din;
  rand bit[7:0] addr;
  rand bit wr_enb;
  
  bit [7:0] dout;
  
  //class registration with factory usin uvm macros.
  
  `uvm_object_utils_begin(seq_item_1)
  	`uvm_field_int(din,UVM_ALL_ON)
  	`uvm_field_int(addr,UVM_ALL_ON)
  	`uvm_field_int(wr_enb,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //CLASS CONSTRUCTOR
  function new(string name="seq_item_1");
    super.new(name);
  endfunction:new
  
  //constraint for din variable;
  constraint din_consrt{din<10;}

  //constriant for the addr;
  constraint addr_consrt{ addr inside{[0:10]};}
  
endclass:seq_item_1



//extend class of seq_item_1
class seq_item_2 extends seq_item_1;
  
  //factory registration
  `uvm_object_utils(seq_item_2)
  
  //default constructor.
  function new(string name ="seq_item_2");
    super.new(name);          
  endfunction:new
               
  //in this class i'm overriding constraints.
   constraint din_consrt{din==5;}
               
   constraint addr_consrt{addr==10;}
               
               
endclass:seq_item_2

module factory_override();
 
 seq_item_1 sq_1;
  
 uvm_factory   factory;
  
 uvm_coreservice_t cs=uvm_coreservice_t::get(); 
  
  
  function void build();
   sq_1 = seq_item_1::type_id::create("sq_1");
    //if use the new() for creating the object ,the factory override method will not work.see the results.
 // sq_1 = new();//comment sq_1 = seq_item_1::type_id::create("sq_1");
    void'(sq_1.randomize());
    sq_1.print();
  endfunction:build
  
  initial begin
    
    factory=cs.get_factory();
    
    repeat(5) begin:B2
      `uvm_info("INFO","Before factory overriding ",UVM_NONE)
      build();
    end:B2
    
    
    
    // i'm overriding my object.
    factory.set_type_override_by_type(seq_item_1::get_type(),seq_item_2::get_type());
    repeat(5) begin:B3
      `uvm_info("INFO","After factory overriding ",UVM_NONE)
    	build();
    end:B3
    
  end
  
endmodule:factory_override



//========================================================================================





//----------------------------------------------------------------------------------------



//========================================================================================



//----------------------------------------------------------------------------------------



//========================================================================================


//----------------------------------------------------------------------------------------



//========================================================================================
