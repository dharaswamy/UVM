class seq_itm1 extends uvm_sequence_item;

//rand fields 
  rand bit [3:0] a,b;
  
  bit arst;
  bit [4:0] y;
  
  //default constructor
  function new(input string name="seq_itm1");
    super.new(name);
  endfunction:new
  
  //factory registration
  `uvm_object_utils_begin(seq_itm1)
  `uvm_field_int(a,UVM_DEFAULT + UVM_DEC)
  `uvm_field_int(b,UVM_DEFAULT + UVM_DEC)
  `uvm_field_int(arst,UVM_DEFAULT + UVM_DEC)
  `uvm_field_int(y,UVM_DEFAULT  + UVM_DEC)
  `uvm_object_utils_end
  
  
endclass:seq_itm1