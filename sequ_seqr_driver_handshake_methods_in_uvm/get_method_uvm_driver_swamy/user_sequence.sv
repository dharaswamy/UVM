

class user_sequence extends uvm_sequence#(transaction);
  
  `uvm_object_utils(user_sequence)
  
  function new(string name = " user_sequence ");
    super.new(name);  
  endfunction:new
  
  virtual task body();
    req = transaction::type_id::create("req");
    start_item(req);
    void'(req.randomize);
    finish_item(req);
    `uvm_info("body"," \n user sequencer the finish item is done  ",UVM_NONE)
    get_response(rsp); // The rsp handle points to the object that the driver has updated
    `uvm_info("body"," \n user_sequncer got the response from the user_driver ",UVM_NONE)
    `uvm_info("body",$sformatf("%0s",rsp.sprint()),UVM_NONE)
  endtask:body
  
endclass:user_sequence