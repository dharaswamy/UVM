class environment extends uvm_env;
  
  component_a comp_a;
  component_b comp_b;
  
  
  
  `uvm_component_utils(environment)
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    comp_a = component_a::type_id::create("comp_a",this);
    comp_b = component_b::type_id::create("comp_b",this);
  endfunction:build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    comp_a.trans_out.connect(comp_b.trans_in);
  endfunction:connect_phase
  
endclass:environment