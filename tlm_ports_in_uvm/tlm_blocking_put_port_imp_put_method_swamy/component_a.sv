// compoent_a is a procedure component and send the transactions to the component_b.

class component_a extends uvm_component;

  
  
  
  `uvm_component_utils(component_a)
  
  
  //TLM communication b/w the two components
  uvm_blocking_put_port#(mem_sequence_item) trans_out;
  
  //declaration handle
  mem_sequence_item mem_seq;
   
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    trans_out=new("trans_out",this);
  endfunction:new
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
 
    repeat(10) begin
      mem_seq=mem_sequence_item::type_id::create("mem_seq");
      assert(mem_seq.randomize()) begin
      `uvm_info("component_a",$sformatf("print from component_a : %0s",mem_seq.sprint()),UVM_NONE)
        trans_out.put(mem_seq);// put() method is a blocking method ,it blocks until the put() task completed at consumer side.
     //`uvm_info("component_a",$sformatf("print from component_a : %0s",mem_seq.sprint()),UVM_NONE)
       end
      else begin
      `uvm_fatal("FATAL RANDOMIZATION",$sformatf(" Randomization is failed in %0s",get_full_name()))
      end
     
    end
    
    phase.drop_objection(this);
    
  endtask:run_phase
  
endclass:component_a