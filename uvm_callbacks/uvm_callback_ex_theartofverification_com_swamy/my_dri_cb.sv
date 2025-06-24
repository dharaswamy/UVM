

class my_dri_cb extends driver_cb;
  `uvm_object_utils(my_dri_cb)
 
    static bit drop = 1;
  function new (string name="my_dri_cb");
    super.new(name);
  endfunction : new
 
  task inject_err(my_driver drv, my_seq_item tr);
    tr.addr = tr.addr + 10;
    tr.data = tr.data + 10;
  endtask : inject_err
endclass : my_dri_cb
 