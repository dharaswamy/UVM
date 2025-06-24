class sub_monitor extends uvm_monitor;
  //factory registration
  `uvm_component_utils(sub_monitor)
  
  //interface handle declaration
  virtual sub_if vif;
  //analysis port declaration
  uvm_analysis_port#(seq_itm2) sap;
  //seq_itm2 class handle declartion
  seq_itm2 trans;
  
  //default constructor
  function new(input string name,uvm_component parent);
    super.new(name,parent);
    sap=new("sap",this);
  endfunction:new
  
   //build_phase responsible for building all lower level components
  //execute in top down manner
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    trans=seq_itm2::type_id::create("trans"); 
    if(!uvm_config_db#(virtual sub_if)::get(this,"","virtual_subtractor_intf",vif) )
       `uvm_fatal(get_type_name(),"UNABLE TO GET THE virtual_subtractor_intf");
  endfunction:build_phase
  
  
task mon_capture();
  
 forever begin:B1
      
        if(vif.srst) begin:B2
        trans.srst = 1'b1;
        sap.write(trans);
        end:B2
      
        else begin:B3
        @(posedge vif.sclk);
        @(posedge vif.sclk);
        trans.srst =1'b0;
        trans.m = vif.m;
        trans.n =vif.n;
        trans.z = vif.z;
        `uvm_info(get_type_name(),"sub_monitor data send to dut",UVM_NONE)
        trans.print();
        sap.write(trans);
        end:B3
      
end:B1
endtask:mon_capture
       
virtual task run_phase(uvm_phase phase);
mon_capture();
endtask:run_phase
  
endclass:sub_monitor