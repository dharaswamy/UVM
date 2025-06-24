class mem_sequence_item extends uvm_sequence_item;
  
  rand bit wr_en;
  rand bit rd_en;
  rand bit [1:0] addr;
  rand bit [7:0] wr_data;
  
  //analysis field
  bit [7:0] rd_data;
  
  function new(string name="mem_sequence_item");
    super.new(name);
  endfunction:new
  
  `uvm_object_utils_begin(mem_sequence_item)
  `uvm_field_int(wr_en,UVM_ALL_ON | UVM_DEC);
  `uvm_field_int(rd_en,UVM_ALL_ON | UVM_DEC);
  `uvm_field_int(wr_data,UVM_ALL_ON | UVM_DEC);
  `uvm_object_utils_end
  
  
endclass:mem_sequence_item