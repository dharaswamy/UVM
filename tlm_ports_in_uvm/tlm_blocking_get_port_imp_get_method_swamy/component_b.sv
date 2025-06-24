// this is a consumer class: component_b.

class component_b extends uvm_component;
  `uvm_component_utils(component_b)
  
 //TLM connection b/w two components
  uvm_blocking_get_port#(mem_sequence_item) get_port;
  
  mem_sequence_item mem_seq;
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    get_port=new("get_port",this);
    endfunction:new
  
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    for(int i=0; i<10 ; i++) begin
       get_port.get(mem_seq);
      `uvm_info(type_name,$sformatf(" %0s ",mem_seq.sprint()),UVM_NONE)
      #10;
    end
  endtask:run_phase
    
  
  
endclass:component_b