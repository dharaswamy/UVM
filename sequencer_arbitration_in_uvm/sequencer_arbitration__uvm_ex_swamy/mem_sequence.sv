
//---------------------------------------------------------------------------
//    class Name :  mem_sequence   
//--------------------------------------------------------------------------


class mem_sequence extends uvm_sequence#(mem_seq_item);
  
  rand bit [7:0]  addr = 1 ;
  
//--------------------------------------------------------------------
// typedef of sequence class 
//---------------------------------------------------------------------
typedef mem_sequence this_type;
  
//------------------------------------------------------------------------------
//         factory registration
//------------------------------------------------------------------------------
  `uvm_object_utils(this_type)
  
//-----------------------------------------------------------------------------
// function : new()                                                           
//----------------------------------------------------------------------------
  function new(string name = "mem_sequence");
    super.new(name);
  endfunction:new
  
//---------------------------------------------------------------------------
//    task : body()                                                        
//-------------------------------------------------------------------------
  
  virtual task body();
    req = mem_seq_item::type_id::create("req");
    start_item(req);
    assert(req.randomize with{ addr == local::addr;})
    else `uvm_fatal(" FATAL ", " RANDOMIZATION FAILED " );
    finish_item(req);
  endtask:body
  
endclass:mem_sequence