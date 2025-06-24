// this is consumer_3 class it has a tlm_analysis_fifo.


class consumer_3 extends uvm_component;
  
  mem_seq_item req;
  
  `uvm_component_utils(consumer_3)
  
  // tlm analysis fifo
  uvm_tlm_analysis_fifo #(mem_seq_item) tlm_analysis_fifo;
  
  
  
  function new(string name = "consumer_3",uvm_component parent);
    super.new(name,parent);
    tlm_analysis_fifo = new ("tlm_analysis_fifo",this);
  endfunction:new
  
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(4) begin
      tlm_analysis_fifo.get(req);
      `uvm_info(get_full_name,$sformatf(" consumer_3 retrived the transaction %0s ",req.sprint()),UVM_NONE)
      #30;
    end
  endtask:run_phase
  
  
endclass:consumer_3

