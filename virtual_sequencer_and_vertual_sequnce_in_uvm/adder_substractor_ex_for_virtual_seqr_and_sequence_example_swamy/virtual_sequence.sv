//------------------------virtual sequence class-------------------------------------

//virtual sequence can be used as stand alone i.e single class but for testcase writter need to provide a complete heairachical path in
//-the test class while starting sequence on the sequencer hence its better to use virtual sequence along with virtual sequencer over stand alone object

class virtual_sequence extends uvm_sequence #(uvm_sequence_item);//paramaterize with uvm_sequence_item bcz it a common parent for multiple xtns(here is only i.e seq_itm) depend------------
  
//factory registration
`uvm_object_utils(virtual_sequence)
  
virtual_sequencer v_seqr;
  
uvm_sequencer #(seq_itm1) aseqr_h;
uvm_sequencer #(seq_itm2) sseqr_h;
  
sequence1 seq1;
sequence2 seq2;
  
  function new (input string name = "virtual_sequence");
super.new(name); 
endfunction:new
  
 //body task 
virtual task body();
seq1=sequence1::type_id::create("seq1");
 seq2=sequence2::type_id::create("seq2");
    
if(! $cast(v_seqr,m_sequencer)) begin:B1                                                //casting between m_sequencer and v_seqr which is there in v_se-----
`uvm_error(get_full_name(),"VIRTUAL SEQUENCER POINTER CAST FAILED $cast(v_seqr,m_sequencer) ") //m_sequencer which deriver from inhereritance concept and its of uvm_sequencer type
end:B1
                                                                                                  
aseqr_h = v_seqr.addr_vir_seqr;//object assignment statement so the seqr which is there in the virtual sequence
sseqr_h = v_seqr.sub_vir_seqr;//(equivalent to physical seqr i.e LHS) will be point to the seqr which is there in-------
    
    
seq1.start(aseqr_h);//starting seq which is there in v_seq to the seqr which is there in v_seq
 #10;                //will be pointing to the sequencer which is there in the virtual sequencer
seq2.start(sseqr_h);
    
endtask:body
  
endclass:virtual_sequence