

class environment extends uvm_env;
  
  `uvm_component_utils(environment)
  
  // producer class
  producer   prudcr;
  
  // consumer class.
  consumer_1 consr_1;
  consumer_2 consr_2;
  consumer_3 consr_3;
  consumer_4 consr_4;
  
  
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_name," build_statared ",UVM_NONE)
    prudcr = producer::type_id::create("prudcr",this);
    consr_1 = consumer_1::type_id::create("consr_1",this);
    consr_2 = consumer_2::type_id::create("consr_2",this);
    consr_3 = consumer_3::type_id::create("consr_3",this);
    consr_4 = consumer_4::type_id::create("consr_4",this);
    
  endfunction:build_phase
  
  
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
     prudcr.analysis_port.connect(consr_1.tlm_analysis_fifo.analysis_export);
     prudcr.analysis_port.connect(consr_2.tlm_analysis_fifo.analysis_export);
     prudcr.analysis_port.connect(consr_3.tlm_analysis_fifo.analysis_export);
     prudcr.analysis_port.connect(consr_4.tlm_analysis_fifo.analysis_export);
    
  endfunction:connect_phase
  
  
    virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info(get_full_name,$sformatf("%0s",this.sprint()),UVM_NONE)
  endfunction:start_of_simulation_phase
  
endclass:environment