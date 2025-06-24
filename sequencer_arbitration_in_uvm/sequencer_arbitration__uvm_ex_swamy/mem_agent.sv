

//----------------------------------------------------------------------------
//  class Name : mem_agent                                                    
//----------------------------------------------------------------------------


class mem_agent extends uvm_agent;
  
//-----------------------------------------------------------
// factory registration                                      
//-----------------------------------------------------------
  
`uvm_component_utils(mem_agent)
  
//--------------------------------------------------------------
// agent sub_components handles declaration                     
//--------------------------------------------------------------
mem_sequencer mem_seqr;
mem_driver    mem_driv;
  
//--------------------------------------------------------------
// analysis port declartion                                     
//--------------------------------------------------------------
uvm_analysis_port#(mem_seq_item) analysis_port;
  
  
//--------------------------------------------------------------
// function : new()                                              
//--------------------------------------------------------------
 
  function new(string name ,uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
//--------------------------------------------------------------
// Function : build_phase ,for building the driver,sequencer,monitor  
//--------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mem_seqr = mem_sequencer::type_id::create("mem_seqr",this);
    mem_driv = mem_driver::type_id::create("mem_driv",this);
  endfunction:build_phase
  
//--------------------------------------------------------------
// Function : connect_phase : for connecting the driver,seqr .   
//--------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mem_driv.seq_item_port.connect(mem_seqr.seq_item_export);
  endfunction:connect_phase
  
endclass:mem_agent


//--------------------------------------------------------------
//                    
//--------------------------------------------------------------