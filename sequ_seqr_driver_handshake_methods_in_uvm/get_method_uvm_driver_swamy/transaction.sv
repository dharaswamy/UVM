

class transaction extends uvm_sequence_item;
  
  rand  bit [7:0] addr;
  rand  bit [7:0] data;
  
  function new(string name = "trans");
    super.new(name);
  endfunction:new
  
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(data,UVM_ALL_ON+UVM_DEC)
  `uvm_object_utils_end
  
  
endclass:transaction