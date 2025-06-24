//in this complete eg,virtual sequence is here along with virtual sequencer
//virtual sequence can be used as stand alone i.e single tone class but we need to provide a complete heairachical path in the test class
//while starting sequence on the  sequencer hence its better to use virtual sequence along with virtual sequencer over

//-----------------------base_test_classs-------------------------------------------------
//creating an env and setting a configuration parameter

`include "env.sv"


class base_test extends uvm_test;
  `uvm_component_utils(base_test)
  //environment handle declaration
  env env_h;
  //config agent handle declaration
  agent_config a_cfg;
  
  //default constructor
  function new(string name,uvm_component parent);
    super.new(name,parent);
   endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = env::type_id::create("env_h",this); //creating an object for env
    a_cfg = agent_config::type_id::create("a_cfg",this);
    uvm_config_db#(agent_config)::set(this,"*","agent_configuration",a_cfg); //this visibility i.e all components
  endfunction:build_phase
   
  //end_of_elaboration_phase prin_topology in buttom up manner
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction:end_of_elaboration_phase 
  
  //report_phase :- display result of the simulation ,execution in buttom up manner
  virtual function void report_phase(uvm_phase phase);
    uvm_report_server svr;
    super.report_phase(phase);
    svr =uvm_report_server::get_server();
    
    if(svr.get_severity_count(UVM_FATAL) + svr.get_severity_count(UVM_ERROR) > 0) begin:B1
      `uvm_info(get_type_name(),"---------------------------------------------",UVM_NONE)
      `uvm_info(get_type_name(),"----------------------- TEST FAIL-------------",UVM_NONE)
      `uvm_info(get_type_name(),"---------------------------------------------",UVM_NONE)
      end:B1
      
    else begin:B2
     `uvm_info(get_type_name(),"---------------------------------------------",UVM_NONE)
     `uvm_info(get_type_name(),"----------------------- TEST PASS-------------",UVM_NONE)
     `uvm_info(get_type_name(),"---------------------------------------------",UVM_NONE) 
    end:B2
    
  endfunction:report_phase
  
endclass:base_test