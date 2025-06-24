//-------------------------------------------------------------------------
//						www.verificationguide.com 
//-------------------------------------------------------------------------

class user_callback extends driver_callback;
  
  `uvm_object_utils(user_callback)
  
  function new(string name = "user_callback");
    super.new(name);
  endfunction
  
  task pre_drive;
    `uvm_info("USER_CALLBACK","Inside pre_drive method",UVM_LOW);
  endtask
  
  task post_drive;
    `uvm_info("USER_CALLBACK","Inside post_drive method",UVM_LOW);
  endtask
endclass