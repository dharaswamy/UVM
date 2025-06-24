
//-----------------------------------------------------------
//  memory transaction class  , class Name : mem_seq_item   and parameterize values 
//      ADDR_WIDTH =8 AND  DATA_WIDTH = 16 
//-----------------------------------------------------------


class mem_seq_item #(parameter ADDR_WIDTH = 8 , DATA_WIDTH = 16 ) extends uvm_sequence_item;
  
  rand bit [ ADDR_WIDTH-1 : 0 ] addr ;
  rand bit [ DATA_WIDTH-1 : 0 ] wdata;
  rand bit                      wr_en;
  rand bit                      rd_en;
  
       bit [ DATA_WIDTH-1 : 0 ] rdata;
  
  //-----------------------------------------------------------------------------
  //  constriants for the wr_en != rd_en                                         
  //-----------------------------------------------------------------------------
  
  constraint wr_en_rd_en_consrt{ wr_en != rd_en ; }
  
  //----------------------------------------------------------------------------
  //     default constructor function : new()
  //----------------------------------------------------------------------------
  
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction:new
  
  //---------------------------------------------------------------------------
  //  factory registration of class and class properityes                    
  //---------------------------------------------------------------------------
  
  `uvm_object_param_utils_begin(mem_seq_item#(ADDR_WIDTH,DATA_WIDTH))
  `uvm_field_int(addr, UVM_ALL_ON | UVM_DEC)
  `uvm_field_int(wdata,UVM_ALL_ON | UVM_DEC)
  `uvm_field_int(rdata,UVM_ALL_ON | UVM_DEC)
  `uvm_field_int(wr_en,UVM_ALL_ON | UVM_BIN)
  `uvm_field_int(rd_en,UVM_ALL_ON | UVM_BIN)
  `uvm_object_utils_end
  
  
  
  
endclass:mem_seq_item