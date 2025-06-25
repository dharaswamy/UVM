
class user_sequencer extends uvm_sequencer#(transaction);
  
  `uvm_component_utils(user_sequencer)
  
  function new(string name,uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
endclass:user_sequencer