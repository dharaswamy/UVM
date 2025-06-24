class adder_monitor extends uvm_monitor;

  seq_itm1 req;
  
  virtual adder_if vif;
  
  uvm_analysis_port #(seq_itm1) aap;
  
  `uvm_component_utils(adder_monitor)
  
  function new(input string name,uvm_component parent);
    super.new(name,parent);
    aap=new("aap",this);
  endfunction:new
  

   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    req=seq_itm1::type_id::create("req"); //req is an inbuild object of xtn type hence no need to declare it
     if(!uvm_config_db#(virtual adder_if)::get(this,"","virtual_adder_intf",vif))
   `uvm_fatal(get_type_name(),"UNABLE TO GET THE virtual_adder_intf");
  endfunction:build_phase

   //capture task
   
   task capture();
     forever begin:B1
       @(posedge vif.aclk);//wait for 1 clk cycle
       
       if(vif.arst) begin:B2
         req.arst=1'b1;
         aap.write(req); //collecting data into aap
       end:B2
       
       else begin:B3
         @(posedge vif.aclk);//wait 2 clk cycles same delay as mention in drv so at rst1 + 1 + 2 here=3 
         @(posedge vif.aclk);//define dealy like this if we have clk block and modport defined inside interface
         req.arst = 1'b0;
         req.a =vif.a; //capturing information from dut through vif
         req.b =vif.b; //either blk or non_blk assignments
         req.y =vif.y;
         `uvm_info(get_type_name(),"adder_monitor send data to SB",UVM_NONE)
         req.print(); ///just print reqctions
         aap.write(req); //ap has write method which is non_blocking in nature
       end:B3
     end:B1
   endtask:capture
   
   
   virtual task run_phase(uvm_phase phase);
     capture();
   endtask:run_phase
   
endclass:adder_monitor