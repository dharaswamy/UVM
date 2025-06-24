

class component_b extends uvm_component;
  `uvm_component_utils(component_b)
  
 //TLM connection b/w two components
  uvm_blocking_put_imp#(mem_sequence_item,component_b) trans_in;
  
  
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    trans_in=new("trans_in",this);
    endfunction:new
  
  
    virtual task put(mem_sequence_item mem_seq);
      
      if(mem_seq.wr_en) begin:write_transaction
        `uvm_info($sformatf("%0s",{type_name," Has got the write sequence"}),$sformatf(" %0s\n ",mem_seq.sprint()),UVM_NONE)
      end:write_transaction
      
      else begin:read_transaction
        `uvm_info($sformatf("%0s",{type_name," Has got the read sequence"}),$sformatf(" %0s\n ",mem_seq.sprint()),UVM_NONE)
      end:read_transaction
      #10;
    endtask:put
    
  
  
endclass:component_b