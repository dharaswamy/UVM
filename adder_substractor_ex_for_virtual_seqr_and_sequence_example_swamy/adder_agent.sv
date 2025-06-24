`include "seq_itm1.sv"
`include "sequence1.sv"
`include "adder_driver.sv"
`include "adder_monitor.sv"

class adder_agent extends uvm_agent;
  
  //handle declaration of agent_config
  agent_config a_cfg;
  //handle declartion of the driver class
  adder_driver adrv_h;
  //uvm_sequencer class 
  uvm_sequencer #(seq_itm1) aseqr_h;
  
  //adder_monitor class handle declartion
  adder_monitor amon_h;
  
  `uvm_component_utils(adder_agent)
  
  function new (input  string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  virtual function void build_phase(uvm_phase  phase);
    super.build_phase(phase);
    amon_h=adder_monitor::type_id::create("amon_h",this);
    a_cfg=agent_config::type_id::create("a_cfg");
    if(!uvm_config_db#(agent_config)::get(this,"","agent_configuration",a_cfg) )
      `uvm_fatal(get_type_name(),"can't get() a_cfg from agent_configuration ,Have you set it?");
    if(a_cfg.is_active == UVM_ACTIVE) begin:B1  //by default its an UVM_ACTIVE
      //if(get_is_active() == UVM_ACTIVE) begin:B1 //first checking active or  passive if active then only creating
      //drv and seqr
      adrv_h = adder_driver::type_id::create("adrv_h",this);
      aseqr_h = uvm_sequencer #(seq_itm1)::type_id::create("aseqr_h",this);
    end:B1
  endfunction:build_phase
  
  //connect_phase is responsible for establishing connection between  all created components by port_expor
  //executes in bottom up manner
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(a_cfg.is_active == UVM_ACTIVE) begin:B1
      adrv_h.seq_item_port.connect(aseqr_h.seq_item_export);
    end:B1
  endfunction:connect_phase
  
endclass:adder_agent