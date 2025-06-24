class sub_driver extends uvm_driver#(seq_itm2);

  //factory registration 
  `uvm_component_utils(sub_driver)
  
  //interface handle declaration
  virtual sub_if vif;
  
  
  //default constructor
  function new(input string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
   //build_phase responsible for building all lower level components
  //execute in top down manner
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    req=seq_itm2::type_id::create("req"); //req is an inbuild object of xtn type hence no need to declare it
    if(!uvm_config_db#(virtual sub_if)::get(this,"","virtual_subtractor_intf",vif) )
       `uvm_fatal(get_type_name(),"UNABLE TO GET THE virtual_subtractor_intf");
  endfunction:build_phase
       
       task sub_drive();
         forever begin:B1
         seq_item_port.get_next_item(req);
         vif.srst <=1'b0;
         vif.m <=req.m;
         vif.n <=req.n;
         repeat(3) @(posedge vif.sclk);
         `uvm_info(get_type_name(),"sub_driver sne data to DUT ",UVM_NONE)
         req.print();
         seq_item_port.item_done();
         end:B1
       endtask:sub_drive
       
       virtual task run_phase(uvm_phase phase);
         sub_drive();
       endtask:run_phase
  
endclass:sub_driver