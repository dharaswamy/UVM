// method-i of registring the parameterized class with factory.


class mem_seq_item #(parameter ADDR_WIDTH = 2 , DATA_WIDTH = 2) extends uvm_sequence_item;
  
  rand bit [ ADDR_WIDTH-1 : 0 ]  addr;
  rand bit [ DATA_WIDTH-1 : 0 ]  wdata;
  rand bit [ DATA_WIDTH-1 : 0 ]  rdata;
  rand bit                       wr_en;
  
  
  //default constructor.
  function new(string name = " mem_seq_item " );
    super.new(name);
  endfunction:new
  
  
  `uvm_object_param_utils_begin(mem_seq_item#(ADDR_WIDTH,DATA_WIDTH))
   `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_field_int(wdata,UVM_ALL_ON)
   `uvm_field_int(rdata,UVM_ALL_ON)
   `uvm_field_int(wr_en,UVM_ALL_ON)
  `uvm_object_utils_end
  
endclass:mem_seq_item