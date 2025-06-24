// Eda link : https://edaplayground.com/x/w5Ut 

// ( swamy ) please copy the code but don't change/modify the code here.

//============================================================================================================================
// TOPIC NAME :   EXAMPLE OF PARAMETRIZED CLASS IN UVM.
//                   i.how to factory registration for parametrization class.
// 									a. method - i.
// 									b. method - ii.
//============================================================================================================================



`include "uvm_macros.svh"
import uvm_pkg::*;

`include "mem_seq_item.sv"
`include "apb_seq_item.sv"


module tb;
  
  
  initial begin
  	mem_seq_item seq1;
    mem_seq_item #(4,8) seq2;
    // ADDR_WIDTH = 2 AND DATA_WIDTH = 3
    seq1 = mem_seq_item::type_id::create("seq1");
    repeat(10) begin
    void'(seq1.randomize());
    `uvm_info(" TRANSACTION ",$sformatf(" %0s ",seq1.sprint()),UVM_NONE)
    end
    
    $display(" \n \n \n ");
    
   // I am override the  ADDR_WIDTH = 4 AND DATA_WIDTH = 8 for this object ' seq2 '.
    seq2 = mem_seq_item#(4,8)::type_id::create("seq2");
    repeat(10) begin
      void'(seq2.randomize());
      `uvm_info(" TRANSACTION ",$sformatf(" %0s ",seq2.sprint()),UVM_NONE)
    end
  end
  
  
  initial begin
    apb_seq_item  apb_seq1;
    //  i am overriding parameters ADDR_WIDTH,DATA_WIDTH FOR OBJECT apb_seq2.
    apb_seq_item #(8,16) apb_seq2;
    
    apb_seq1 = apb_seq_item::type_id::create("apb_seq1");
    repeat(10) begin
      void'(apb_seq1.randomize());
      `uvm_info(" apb_transaction ", $sformatf(" %0s ",apb_seq1.sprint()),UVM_NONE)
    end
    
    $display("\n \n \n ");
    apb_seq2 = apb_seq_item#(8,16)::type_id::create("apb_seq2");
    repeat(10) begin
      void'(apb_seq2.randomize());
      `uvm_info(" apb_transaction",$sformatf("%0s",apb_seq2.sprint()),UVM_NONE)
    end
    
  end
  
  
endmodule:tb