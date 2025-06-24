


class my_seq extends uvm_sequence #(my_seq_item);
  `uvm_object_utils (my_seq)
 
  function new(string name="my_seq");
    super.new(name);
  endfunction : new
 
  task body ();
    `uvm_create(req)
    if(!req.randomize())
    begin
      `uvm_fatal(get_name(), $sformatf("Randomization failed"))
    end
    `uvm_info (get_name(),
               $sformatf("After randomizating in my_seq my_seq_item= %s",
               req.convert2string()), UVM_LOW)
    `uvm_send(req)
  endtask : body
 
endclass : my_seq