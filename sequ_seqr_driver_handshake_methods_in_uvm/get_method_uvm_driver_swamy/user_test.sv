

class user_test extends uvm_test;
  
  user_sequence sequ;
  user_sequencer seqr;
  user_driver driv;
  
  
  `uvm_component_utils(user_test)
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build_phase_test"," \n building the components and objects in test started ",UVM_NONE)
    sequ = user_sequence::type_id::create("sequ");
    seqr = user_sequencer::type_id::create("seqr",this);
    driv = user_driver::type_id::create("driv",this);
    `uvm_info("build_phase_test"," \n building the components and objects in test done ",UVM_NONE)
  endfunction:build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     driv.seq_item_port.connect(seqr.seq_item_export);
    `uvm_info("connect_phase_test","\n driver and sequencer connection established ",UVM_NONE);
  endfunction:connect_phase
  
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    sequ.start(seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,200);
    
  endtask:run_phase
  
  
  
endclass:user_test