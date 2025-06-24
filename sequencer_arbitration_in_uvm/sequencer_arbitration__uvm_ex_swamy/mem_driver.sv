
//-------------------------------------------------------------------------
//  Class Name :   mem_driver                                              
//-------------------------------------------------------------------------

class mem_driver extends uvm_driver#(mem_seq_item);
  
  
//--------------------------------------------------------------------
// factory registration                                               
//--------------------------------------------------------------------
  `uvm_component_utils(mem_driver)
  
//-------------------------------------------------------------------
// Function  : new()                                                 
//-------------------------------------------------------------------
 
function new(string name,uvm_component parent);
  super.new(name,parent);
endfunction:new

//-------------------------------------------------------------------
//      Task : run_phase()                                           
//-------------------------------------------------------------------
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin:forever_begin
      seq_item_port.get_next_item(req);
      `uvm_info(get_name,$sformatf(" Driver recieved seq_item \n %0s ",req.sprint()),UVM_NONE)
      seq_item_port.item_done();
    end:forever_begin
  endtask:run_phase
  
  
  
endclass:mem_driver