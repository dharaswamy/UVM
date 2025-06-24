



class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  
  environment env1;
  
  uvm_factory factory;
  
   uvm_coreservice_t cs = uvm_coreservice_t::get();
  
  function new (string name,uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env1 = environment::type_id::create("env1",this);
  endfunction:build_phase
  
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    this.print();
    factory = cs.get_factory();
    factory.print();
  endfunction:end_of_elaboration_phase
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    #200;
    phase.drop_objection(this);
    
  endtask:run_phase
  
endclass:test