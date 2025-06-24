


// Eda link : 
// ( swamy ) please copy the code but don't change/modify the code here.


//====================================================================================================================

// TOPIC NAME : TLM PUT PORT ,REF :VLSI VERIFY.
                   
// 	 Example of TLM 1.0 uvm_put_port and uvm_put_imp method using int
						
// 	HERE THE PROCEDURE PUT TYPE = INT (INTEGER VALUES ) AND CONSUMER GET THE INTERGER VALUES.
// 	 I.put()
// 	II.try_put()
// 	iiii.can_put()
//====================================================================================================================

`include "uvm_macros.svh"
import uvm_pkg::*;

class producer extends uvm_component;
  uvm_put_port#(int) tlm_put;
  
  `uvm_component_utils(producer)
  
  function new(string name = "producer", uvm_component parent = null);
    super.new(name, parent);
    tlm_put = new("tlm_put", this);
  endfunction
  
//   task run_phase(uvm_phase phase);
//     int value = 10;
//     super.run_phase(phase);
    
//     `uvm_info(get_type_name(), $sformatf("Send value = %0h", value), UVM_NONE);
//     tlm_put.put(value);
//     if(tlm_put.try_put(20)) 
//     `uvm_info(type_name ," try_put successfully ",UVM_NONE)
//     else `uvm_warning(type_name," try_put failed ")
//      tlm_put.can_put();
    
//   endtask
endclass

class consumer extends uvm_component;
  uvm_put_imp #(int, consumer) tlm_imp;
   
  `uvm_component_utils(consumer)
  
  function new(string name = "consumer", uvm_component parent = null);
    super.new(name, parent);
    tlm_imp = new("tlm_imp", this);
  endfunction
  
  virtual task put(int val);
    #10;
    `uvm_info(get_type_name(), $sformatf("Received value = %0h", val), UVM_NONE);
  endtask
  
  virtual function bit try_put(int val);
    `uvm_info(get_type_name(), $sformatf("Received try_put value = %0h", val), UVM_NONE);
    return 1;
  endfunction
  
  virtual function bit can_put();
    `uvm_info(get_type_name(), "inside can_put", UVM_NONE);
    return 1;
  endfunction
  
endclass

class env extends uvm_env;
  producer pro;
  consumer con;
  `uvm_component_utils(env)
  
  function new(string name = "env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    pro = producer::type_id::create("pro", this);
    con = consumer::type_id::create("con", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    pro.tlm_put.connect(con.tlm_imp);
  endfunction
  
endclass
              
class test extends uvm_test;
  env env_o;
  `uvm_component_utils(test)
  
  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_o = env::type_id::create("env_o", this);
  endfunction
  
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info(get_type_name,"\\n ==============end of elaboration of phase \\nn =============",UVM_NONE)
  endfunction:end_of_elaboration_phase
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #50;
    phase.drop_objection(this);
  endtask
endclass

module tb_top;
  initial begin
    run_test("test");
  end
endmodule
