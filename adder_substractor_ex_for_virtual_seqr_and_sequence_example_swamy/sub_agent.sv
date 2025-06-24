`include "seq_itm2.sv"
`include "sequence2.sv"
`include "sub_driver.sv"
`include "sub_monitor.sv"
class sub_agent extends uvm_agent;
  
  //factory registratin
  `uvm_component_utils(sub_agent)
  
  //agent config class handle declaration
  agent_config  a_cfg;
  //handle declartion of the driver class
  sub_driver sdrv_h;
  //sequencer class 
  uvm_sequencer #(seq_itm2) sseqr_h;
  //handle declartion of the monitor class
  sub_monitor smon_h;
  
 //default constructor
  function new(input string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //creating the monitor
    smon_h=sub_monitor::type_id::create("smon_h",this);
    a_cfg=agent_config::type_id::create("a_cfg",this);
    
    if(!uvm_config_db#(agent_config)::get(this,"","agent_configuration",a_cfg) )
      `uvm_fatal(get_type_name(),"can't get() a_cfg from agent_configuration ,Have you set it?");
       if(a_cfg.is_active == UVM_ACTIVE) begin:B1
         sdrv_h=sub_driver::type_id::create("sdrv_h",this);
         sseqr_h = uvm_sequencer#(seq_itm2)::type_id::create("sseqr_h",this);
       end:B1
  endfunction:build_phase
       
       virtual function void connect_phase(uvm_phase phase);
         super.connect_phase(phase);
         if(a_cfg.is_active ==UVM_ACTIVE) begin:B1
           sdrv_h.seq_item_port.connect(sseqr_h.seq_item_export);
         end:B1
       endfunction:connect_phase
  
endclass:sub_agent