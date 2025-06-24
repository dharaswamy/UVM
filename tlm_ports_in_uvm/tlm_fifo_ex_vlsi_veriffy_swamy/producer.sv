
// for broadcasting the transactions to multiple consumers ,the producer class using analysis port);

class producer extends uvm_component;
  
 mem_seq_item req,req1;
  
  // analsysis port declaration.
  uvm_put_port #(mem_seq_item) put_port;
  
  
  `uvm_component_utils(producer)
  
  function new(string name,uvm_component parent);
    super.new(name,parent);  
    // i am creating the analysis port
    put_port = new("put_port",this);
  endfunction:new
  
  
  virtual task run_phase(uvm_phase phase);
    req = mem_seq_item::type_id::create("req");
    super.run_phase(phase);
    
    repeat(4) begin
      assert(req.randomize());
      $cast(req1,req.clone());
      `uvm_info(get_type_name,$sformatf(" producer broadcasting the trasaction %0s ",req.sprint()),UVM_NONE)
      put_port.put(req1);
    end
    
  endtask:run_phase
  
endclass:producer