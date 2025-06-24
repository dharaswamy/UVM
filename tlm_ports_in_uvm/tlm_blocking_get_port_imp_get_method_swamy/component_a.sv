

// This is proceducer class: component_a.


class component_a extends uvm_component;

  `uvm_component_utils(component_a)
  
  
  //TLM communication b/w the two components
  uvm_blocking_get_imp#(mem_sequence_item,component_a) get_export;
  
  //declaration handle
  mem_sequence_item mem_seq;
   
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    get_export=new("get_export",this);
  endfunction:new
  
  virtual task get(output mem_sequence_item mem_seq);
   mem_sequence_item  mem_seq1 = new();
  assert(mem_seq1.randomize()) begin
    mem_seq = mem_seq1;
    `uvm_info(type_name,$sformatf("%0s",mem_seq.sprint()),UVM_NONE)
  end
  else begin
  `uvm_fatal("FATAL ERROR"," RANDOMIZATION IS FAILED");
  end
  endtask:get
  
  
  

  
endclass:component_a