// Note_from_cook_book_uvm : get() method call to collect the request sequence_item, which would unblock the finish_item() call in the sequence execution.

class user_driver extends uvm_driver#(transaction);
  
  `uvm_component_utils(user_driver)
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    seq_item_port.get(req);
    `uvm_info("user_driver","sequence item has received ",UVM_NONE)
    `uvm_info("user_driver",$sformatf(" user_driver received sequence item \n %0s ",req.sprint),UVM_NONE)
     #20;
    //seq_item_port.item_done(req); when you use the " get() " method use only put() ,don't use the ' item_done();
    req.addr = req.addr+10;
    $cast(rsp,req.clone());
    rsp.set_id_info(req);
    seq_item_port.put(rsp); // Set the rsp id = req id
    `uvm_info("user_driver"," driver completed the pin level interface activity",UVM_NONE);
  endtask:run_phase
    
endclass:user_driver