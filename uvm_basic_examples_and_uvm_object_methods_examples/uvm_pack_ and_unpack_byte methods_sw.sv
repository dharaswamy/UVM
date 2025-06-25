

// eda link : https://edaplayground.com/x/X_A2 

// ( swamy ) please copy the code but don't change/modify the code here.  

//==========================================================================================================================================
// Topic Name: Using uvm object pack and unpack method. pack in array of bytes. www.verificationguide.com
   
// 	 i.pack_bytes.
// 	ii.unpack_bytes.
//==========================================================================================================================================

//-------------------------------------------------------------------------
//						www.verificationguide.com 
//-------------------------------------------------------------------------
class mem_seq_item extends uvm_sequence_item;
  //data and control fields
  rand bit [3:0] addr;
  rand bit       wr_en;
  rand bit       rd_en;
  rand bit [7:0] wdata;
       bit [7:0] rdata;
  
  //Utility and Field macros,
  `uvm_object_utils_begin(mem_seq_item)
    `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_int(wr_en,UVM_ALL_ON)
    `uvm_field_int(rd_en,UVM_ALL_ON)
    `uvm_field_int(wdata,UVM_ALL_ON)
  `uvm_object_utils_end
  
  //Constructor
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction
  
  //constaint, to generate any one among write and read
  constraint wr_rd_c { wr_en != rd_en; }; 
  
endclass

//-------------------------------------------------------------------------
//Simple TestBench to access sequence item
//-------------------------------------------------------------------------
module seq_item_tb;
  
  //instance
  mem_seq_item seq_item_0;
  mem_seq_item seq_item_1;
  
 // byte  byte_packed_data[];//it gives an error because when u pass the argument "byte_packed_data" in "pack_bytes()" method ,formal and actual argument data type of ref argument is mismatch.
  
  byte unsigned  byte_packed_data[];
  
  initial begin
    //create method
    seq_item_0 = mem_seq_item::type_id::create("seq_item_0");
    seq_item_1 = mem_seq_item::type_id::create("seq_item_1");
    
    //---------------------- PACK  ------------------------------  
    seq_item_0.randomize(); //randomizing the seq_item_0
    seq_item_0.print();     //printing the seq_item_0
    
    seq_item_0.pack_bytes(byte_packed_data);    //pack method
    
    foreach(byte_packed_data[i]) 
      `uvm_info("PACK",$sformatf("byte_packed_data[%0d] = %b",i,byte_packed_data[i]), UVM_LOW)
      
    //---------------------- UNPACK ------------------------------
    `uvm_info("UNPACK","Before UnPack", UVM_LOW)
    seq_item_1.print();     //printing the seq_item_1
    
    seq_item_1.unpack_bytes(byte_packed_data);     //unpack method
    
    `uvm_info("UNPACK","After UnPack", UVM_LOW)
    seq_item_1.print();     //printing the seq_item_1

  end  
endmodule
