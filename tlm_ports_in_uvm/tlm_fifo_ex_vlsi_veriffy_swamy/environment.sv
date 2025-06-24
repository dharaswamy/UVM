

class environment extends uvm_env;
  
  `uvm_component_utils(environment)
  
  // producer class
  producer   prudcr;
  
  // consumer class.
  consumer_1 consr_1;
  
  // in env we create tlm fifo .
  uvm_tlm_fifo #(mem_seq_item) tlm_fifo;
  
  
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    tlm_fifo = new("tlm_fifo",this,10);// my tlm fifo size = 10.
  endfunction:new
  
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_name," build_statared ",UVM_NONE)
    prudcr = producer::type_id::create("prudcr",this);
    consr_1 = consumer_1::type_id::create("consr_1",this);
    
  endfunction:build_phase
  
  
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
      prudcr.put_port.connect(tlm_fifo.put_export);
      consr_1.get_port.connect(tlm_fifo.get_export);
  endfunction:connect_phase
  
  
    virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info(get_full_name,$sformatf("%0s",this.sprint()),UVM_NONE)
  endfunction:start_of_simulation_phase
  
endclass:environment