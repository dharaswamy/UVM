

class my_seq_item extends uvm_sequence_item;
 
  rand logic [7:0] addr;
  rand logic [7:0] data;
 
  constraint addr_range_cn {
    addr inside {[10:20]};
  }
 
  constraint data_range_cn {
    data inside {[100:200]};
  }
 
  `uvm_object_utils_begin(my_seq_item)
  `uvm_field_int(addr, UVM_ALL_ON| UVM_DEC)
  `uvm_field_int(data, UVM_ALL_ON| UVM_DEC)
  `uvm_object_utils_end
 
  function new(string name="my_seq_item");
    super.new(name);
  endfunction : new
 
  virtual function string convert2string();
    convert2string = $sformatf("addr=%0d, data=%0d", addr, data);
  endfunction : convert2string
 
endclass : my_seq_item
 