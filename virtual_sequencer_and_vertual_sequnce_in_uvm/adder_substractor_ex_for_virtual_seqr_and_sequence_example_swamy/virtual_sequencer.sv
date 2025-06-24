

class virtual_sequencer extends uvm_sequencer #(uvm_sequence_item); //paramaterized with uvm_sequence_item bcz it's a common for multiple sequencer(multiple agents will have ------
  
  //virtual sequencer for the adder
  uvm_sequencer #(seq_itm1) addr_vir_seqr; //handle of physical sequencers
  //virtual sequencer for the sub
  uvm_sequencer #(seq_itm2) sub_vir_seqr;

  `uvm_component_utils(virtual_sequencer)
  
  function new(input string name ,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  
endclass:virtual_sequencer