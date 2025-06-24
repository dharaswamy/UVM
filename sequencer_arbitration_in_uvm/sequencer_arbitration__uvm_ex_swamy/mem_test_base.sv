
//--------------------------------------------------------------
//  Class Name : mem_test_base  , base test class
//--------------------------------------------------------------

class mem_test_base extends uvm_test;
  
//--------------------------------------------------------------
// factory registration   
//--------------------------------------------------------------

`uvm_component_utils(mem_test_base)
  
  
//--------------------------------------------------------------
//  environment handle declaration                              
//--------------------------------------------------------------
  
mem_environment mem_env;
  
//--------------------------------------------------------------
// Function : new, default constructor.
//--------------------------------------------------------------
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  
//--------------------------------------------------------------
// Function : build_phase  , for building the environment.
//--------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mem_env  = mem_environment::type_id::create("mem_env",this);
  endfunction:build_phase
  
//--------------------------------------------------------------
  // Function  Name : end_of_elaboration_phase  
//--------------------------------------------------------------
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    this.print();
  endfunction:end_of_elaboration_phase
  
//--------------------------------------------------------------
// function Name : start_of_simulation_phase 
//--------------------------------------------------------------
  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
   // factory .print();
  endfunction:start_of_simulation_phase
  
  
  
endclass:mem_test_base




//--------------------------------------------------------------
//                    
//--------------------------------------------------------------