//--------------------------------envclass-------------------------------------------
//instance of sb,agent and coverage collector if any
//connect analysis port(ap) of monitor and analysis implimentation (aip) port of scb

`include "agent_config.sv"
`include "adder_agent.sv"
`include "sub_agent.sv"
`include "scoreboard.sv"
`include "virtual_sequencer.sv"
`include "virtual_sequence.sv"


class env extends uvm_env;

  `uvm_component_utils(env)
  
  scoreboard sb;                 
  adder_agent add_agth;
  sub_agent sub_agth;
  virtual_sequencer v_seqr;   //compare to normal environment class ,this env had a new component called virtual sequencer
  
  //default constructor
  
  function new (string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  //build phase is responsible for bilding all lower level components executes in top down manner.
  virtual function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    sb=scoreboard::type_id::create("sb",this);
    add_agth=adder_agent::type_id::create("add_agth",this);
    sub_agth=sub_agent::type_id::create("sub_agth",this);
    v_seqr =virtual_sequencer::type_id::create("v_seqr",this);
    
  endfunction:build_phase
  
  //connect phase is responsible for establishing  connecton t/w all created componet by TLM port_export executes in bottom up manner.
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    add_agth.amon_h.aap.connect(sb.add_aip); //connection ap of mon and aip of sb,start with mon bcz it's an initiator
    sub_agth.smon_h.sap.connect(sb.sub_aip);
                                            //sequencer handle which is there is a virtual sequencer
    v_seqr.addr_vir_seqr = add_agth.aseqr_h;// is pointing towards physical sequencer handle
    v_seqr.sub_vir_seqr = sub_agth.sseqr_h; // i.e   object assignment statement
  
  endfunction:connect_phase
  
endclass:env