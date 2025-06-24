// method-ii of registring the parameterized class with factory.

class apb_seq_item #(parameter ADDR_WIDTH = 4 ,DATA_WIDTH = 8) extends uvm_sequence_item;
  
  
  rand bit [ ADDR_WIDTH-1 : 0 ] paddr;
  rand bit [ DATA_WIDTH-1 : 0 ] pwdata;
  rand bit [ DATA_WIDTH-1 : 0 ] prdata;
  rand bit                      pwr_en;
  rand bit                      pselx;
  rand bit                      penable;
       bit                      pslverr;
  
  //default constructor.
  function new(string name = "apb_seq_item");
    super.new(name);
  endfunction:new
  
  // for parameter class factory registration.
  typedef apb_seq_item #(ADDR_WIDTH,DATA_WIDTH) this_type;
  
  // factory registration.
  `uvm_object_param_utils_begin(this_type)
  `uvm_field_int(paddr,UVM_ALL_ON)
  `uvm_field_int(pwdata,UVM_ALL_ON)
  `uvm_field_int(prdata,UVM_ALL_ON)
  `uvm_field_int(pwr_en,UVM_ALL_ON)
  `uvm_field_int(pselx,UVM_ALL_ON)
  `uvm_field_int(penable,UVM_ALL_ON)
  `uvm_field_int(pslverr,UVM_ALL_ON)
  `uvm_object_utils_end
  
endclass:apb_seq_item