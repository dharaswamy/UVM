//--------------------------------------------------------------
//      Class Name : mem_test_1                                 
//  sequecer arbitration mechanism : default (UVM_SEQ_ARB_FIFO).
// Here 4 sequences start at same time and  they have individual priorites.
//--------------------------------------------------------------

class mem_test_1 extends mem_test_base;
  
//--------------------------------------------------------------
// sequence handle declaration                                  
//--------------------------------------------------------------
  mem_sequence mem_sequ[8];// mem_sequ[0],mem_sequ[1],mem_sequ[2],mem_sequ[3] ------- mem_sequ[7].


  
  
//--------------------------------------------------------------
// Factory registration  
//--------------------------------------------------------------
`uvm_component_utils(mem_test_1)
  
//--------------------------------------------------------------
//  Function : new() ,default constructor.
//--------------------------------------------------------------
  function new(string name , uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
//--------------------------------------------------------------
// Function : build_phase()
//--------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    foreach(mem_sequ[i]) 
      mem_sequ[i] = mem_sequence::type_id::create($sformatf("mem_sequ[%0d]",i));
  endfunction:build_phase
  
//-------------------------------------------------------------------------
// Task  : run_phase                                                       
//-------------------------------------------------------------------------
  
  virtual task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    void'(mem_sequ[0].randomize with{ addr == 50;});
    void'(mem_sequ[1].randomize with{ addr == 100;});
    void'(mem_sequ[2].randomize with{ addr == 200;});
    void'(mem_sequ[3].randomize with{ addr == 250;});
    void'(mem_sequ[4].randomize with{ addr == 250;});
    void'(mem_sequ[5].randomize with{ addr == 250;});
    void'(mem_sequ[6].randomize with{ addr == 250;});
    void'(mem_sequ[7].randomize with{ addr == 250;});
    phase.raise_objection(this);
    fork
      mem_sequ[0].start(mem_env.mem_agt.mem_seqr,.this_priority(50));
      mem_sequ[1].start(mem_env.mem_agt.mem_seqr,.this_priority(100));
      mem_sequ[2].start(mem_env.mem_agt.mem_seqr,.this_priority(200));
      mem_sequ[3].start(mem_env.mem_agt.mem_seqr,.this_priority(250));
      mem_sequ[4].start(mem_env.mem_agt.mem_seqr,.this_priority(250));
      mem_sequ[5].start(mem_env.mem_agt.mem_seqr,.this_priority(250));
      mem_sequ[6].start(mem_env.mem_agt.mem_seqr,.this_priority(250));
      mem_sequ[7].start(mem_env.mem_agt.mem_seqr,.this_priority(250));
      
    join
    phase.drop_objection(this);
   // phase.phase_done.set_drain_time(this,100);
    
  endtask:run_phase
  
//--------------------------------------------------------------
//
//--------------------------------------------------------------
  
  
endclass:mem_test_1