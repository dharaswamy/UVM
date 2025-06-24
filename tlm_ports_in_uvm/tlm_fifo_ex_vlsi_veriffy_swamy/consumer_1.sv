// this is consumer_1 class it has a get_port.


class consumer_1 extends uvm_component;
  
  mem_seq_item req;
  
  `uvm_component_utils(consumer_1)
  
  // tlm analysis fifo
  uvm_get_port #(mem_seq_item) get_port;
  
  
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);
    get_port = new ("get_port",this);
  endfunction:new
  
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(4) begin
      get_port.get(req);
      `uvm_info(get_full_name,$sformatf(" consumer_1 retrived the transaction %0s ",req.sprint()),UVM_NONE)
      #10;
    end
  endtask:run_phase
  
  
endclass:consumer_1


