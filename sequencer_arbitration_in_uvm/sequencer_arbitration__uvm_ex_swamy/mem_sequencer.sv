//----------------------------------------------------------------------------
//  class Name : mem_sequencer                                                
//----------------------------------------------------------------------------


class mem_sequencer extends uvm_sequencer#(mem_seq_item);
  
//-----------------------------------------------------------
// factory registration                                      
//-----------------------------------------------------------
  
`uvm_component_utils(mem_sequencer)
  
//--------------------------------------------------------------
// function : new()                                              
//--------------------------------------------------------------
 
  function new(string name ,uvm_component parent);
    super.new(name,parent);  
  endfunction:new

  
endclass:mem_sequencer