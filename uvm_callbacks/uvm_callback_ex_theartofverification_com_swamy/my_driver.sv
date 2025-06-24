

class my_driver extends uvm_driver #(my_seq_item);
  `uvm_component_utils (my_driver)
 
  // Register Callback
  `uvm_register_cb(my_driver,driver_cb)
 
  function new (string name="my_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase
 
  virtual task inject_err(my_seq_item tr);
    `uvm_do_callbacks(my_driver, driver_cb, inject_err(this,tr))
  endtask : inject_err
 
  task run_phase(uvm_phase phase);
    forever
    begin
      #5;
      seq_item_port.get_next_item(req);
      inject_err(req);
      `uvm_info(get_name(),
                $sformatf("After passing throguh callback in driver my_seq_item= %s",
                req.convert2string()), UVM_LOW);
      #5;
      seq_item_port.item_done();
    end
  endtask : run_phase
endclass : my_driver