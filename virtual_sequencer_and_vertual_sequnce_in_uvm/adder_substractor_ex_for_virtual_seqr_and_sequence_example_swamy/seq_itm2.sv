class seq_itm2 extends uvm_sequence_item;
  //rand fields
  rand bit [3:0] m;
  rand bit [3:0] n;
  
  
   bit srst;
  //analysis field 
  bit [4:0] z;
  
  //default constructor 
  function new(input string name="seq_itm2");
    super.new(name);
  endfunction:new
  
  //factory registration
  `uvm_object_utils_begin(seq_itm2)
  `uvm_field_int(m,UVM_DEFAULT + UVM_DEC)
  `uvm_field_int(n,UVM_DEFAULT + UVM_DEC)
  `uvm_field_int(srst,UVM_DEFAULT + UVM_DEC)
  `uvm_field_int(z,UVM_DEFAULT + UVM_DEC)
  `uvm_object_utils_end
  
endclass:seq_itm2