//---------------------------------test class--------------------------------------------

//choose which specific sequence is to be send to driver through sequencer
//i.e starting particular sequence on the sequencer

class test_one extends base_test;
  //factory registration
  `uvm_component_utils(test_one)
  //
  virtual_sequence vseq_h;
  
  //default constructor
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  //build_phase responsible for building all lower lever components executes in top down manner
  virtual function void build_phase(uvm_phase phase); //simply calling super.build_phase bcz parent build_phase constaining 
    super.build_phase(phase);                        //- a logic corresponding to config_db and creating the env
  endfunction:build_phase
  
  
  //IMP NOTE:We only call super.build_phase(phase) :on components extended from user defined components,never call super.build_phase(phase) :on components which are directly extended from uvm_component,uvm_env,or uvm_test
  
  //run_phase:- task bcz contain delay :- driver drive stimuls to duta nd mnitor capture informaton from dut based on dut protocol.
  //-executes in parallel and all pre_post run phases.
  
  //now test don't have access of sequence it has access of virtual sequence hence we are starting v_seq on v_seqr which is there in env
  
  virtual task run_phase(uvm_phase phase);
    vseq_h = virtual_sequence::type_id::create("vseq_h");
    phase.raise_objection(this);
    vseq_h.start(env_h.v_seqr); //starting virtual sequence on to the cirtual sequencer
    phase.drop_objection(this);//set a drain time for the env if desired
  endtask:run_phase            //so here no need to provided complete heararchical path
endclass:test_one