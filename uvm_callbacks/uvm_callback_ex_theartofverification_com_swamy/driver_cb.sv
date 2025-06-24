typedef class my_driver;
  
class driver_cb extends uvm_callback;
  
  `uvm_object_utils (driver_cb)
 
  function new(string name="driver_cb");
    super.new(name);
  endfunction : new
 
  // callback method shall be virtual.
  virtual task inject_err(my_driver drv, my_seq_item tr); 
  endtask : inject_err
 
endclass : driver_cb