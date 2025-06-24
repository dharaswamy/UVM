class agent_config extends uvm_object;
  
uvm_active_passive_enum is_active=UVM_ACTIVE;// 

  
  `uvm_object_utils(agent_config)
  
  //bit has-scoreboard ='1;
  //bit has-functional_coverage ='1;
  
  function new(input string name="agent_config");
    super.new(name);
  endfunction:new
  
 
  
endclass:agent_config