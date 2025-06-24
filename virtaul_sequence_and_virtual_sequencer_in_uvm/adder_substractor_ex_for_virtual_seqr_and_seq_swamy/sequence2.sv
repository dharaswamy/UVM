class sequence2 extends uvm_sequence#(seq_itm2);
  
//factory registration
  `uvm_object_utils(sequence2)
  
  //default constructor
  function new(input string name="sequence2");
    super.new(name);
  endfunction:new
  
 
  //task body
  virtual task body();
    //req=seq_itm2::type_id::create("req");
    repeat(5) begin:B1
      //start_item(req);
      //void'(req.randomize());
      //req.rst='0;
      //`uvm_info(get_type_name(),"Data send to driver",UVM_NONE)
      //req.print();
      //finish_item(req);
      
      `uvm_do(req)
      `uvm_info(get_type_name(),"Data send to Driver",UVM_NONE)
      req.print();
    end:B1
    
  endtask:body
  
endclass:sequence2