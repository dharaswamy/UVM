

class test  extends uvm_test;
  
  `uvm_component_utils(test)
  
  environment env1;
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env1 = environment::type_id::create("env1",this);
  endfunction:build_phase
  
  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info(get_full_name,$sformatf("%0s",this.sprint()),UVM_NONE)
  endfunction:start_of_simulation_phase
  
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
     #300;
    phase.drop_objection(this);
    
    phase.phase_done.set_drain_time(this,100);
  endtask:run_phase
  
endclass:test