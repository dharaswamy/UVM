

//--------------------------------------------------------------
// Class Name : mem_environment 
//--------------------------------------------------------------

class mem_environment extends uvm_env;
  
//--------------------------------------------------------------
// factory registration 
//--------------------------------------------------------------
  
`uvm_component_utils(mem_environment)
  
//--------------------------------------------------------------
//  environmen//--------------------------------------------------------------
//                    
//--------------------------------------------------------------t sub components handles declaration. 
//--------------------------------------------------------------
mem_agent mem_agt;
  
//--------------------------------------------------------------
// Function : new()                                             
//--------------------------------------------------------------
  function new(string name , uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
//--------------------------------------------------------------
// Function : build_phase   , for building the loweer components 
//--------------------------------------------------------------
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mem_agt = mem_agent::type_id::create("mem_agt",this);
  endfunction:build_phase
  
endclass:mem_environment





























//--------------------------------------------------------------
//                    
//--------------------------------------------------------------