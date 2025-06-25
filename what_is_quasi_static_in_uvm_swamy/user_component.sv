
class user_component extends uvm_component;
  
  
  
  int data;
  
  //calling constructor.
  function new(string name ,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  //factory registration
  `uvm_component_utils_begin(user_component)
  	`uvm_field_int(data,UVM_ALL_ON)
  `uvm_component_utils_end
  
endclass:user_component