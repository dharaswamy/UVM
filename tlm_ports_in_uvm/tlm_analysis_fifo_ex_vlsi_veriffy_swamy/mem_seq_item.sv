

class mem_seq_item  extends uvm_sequence_item;
  
 rand bit [2:0] addr;
 rand bit [7:0] data;
 rand bit wr_en,rd_en;
  
  constraint wr_rd_consrt{ wr_en != rd_en;}
  
  function new(string name= " mem_seq_item");
    super.new(name);
  endfunction:new
  
  `uvm_object_utils_begin(mem_seq_item)
  `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_field_int(data,UVM_ALL_ON)
  `uvm_field_int(wr_en,UVM_ALL_ON)
  `uvm_field_int(rd_en,UVM_ALL_ON)
  `uvm_object_utils_end
  
  
  
  
  
endclass:mem_seq_item