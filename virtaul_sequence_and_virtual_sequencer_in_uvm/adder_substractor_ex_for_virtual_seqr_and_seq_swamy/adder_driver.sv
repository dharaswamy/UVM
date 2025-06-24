class adder_driver extends uvm_driver#(seq_itm1);
  
   `uvm_component_utils(adder_driver) //factory regoistration
  
  virtual adder_if vif; //interface is static hence inside class need to declare as virtual
                        //bcz class is dynamic and interface is static component
  
 
  function new(input string name,uvm_component parent); //component hence two arguments
    super.new(name,parent); //components are static in nature need to be there through out th simulation 
  endfunction:new
  
 //build_phase responsible for building all lower level components
  //execute in top down manner
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(! uvm_config_db#(virtual adder_if)::get(this," ","virtual_adder_intf",vif)) begin
      `uvm_fatal(get_type_name(),"UNABLE TO GET THE virtual_adder_intf")
    end
req=seq_itm1::type_id::create("req"); //req is an inbuild object of xtn type hence no need to declare it
  endfunction:build_phase

   task drive();
     forever begin:B1
       seq_item_port.get_next_item(req);
       vif.arst <= 1'b0;
       vif.a <= req.a;
       vif.b <= req.b;
       repeat(3) @(posedge vif.aclk);
       `uvm_info(get_type_name(),"adder_driver send data to DUT",UVM_NONE)
       req.print();
       seq_item_port.item_done();
     end:B1
     
   endtask:drive
//run_phase : task bcz contain delay: driver drive stimuls to dut and monitor capture information from dut based on dut protocol
//- executes in parallel and all pre_post run phases.
   //seq_item_port.get_next_item(req) send a request to get the sequence item and waiting for the sequence item
   //drive the sequence_item to dut //which is a user defind task
   //seq_item_port.item_done(req); //send the ack for item done
   
   virtual task run_phase(uvm_phase phase);
     drive();
   endtask:run_phase
       
       
endclass:adder_driver