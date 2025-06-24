//as we have two writes method in monitor classes
`uvm_analysis_imp_decl(_add) //declared for adder and for subtractor
`uvm_analysis_imp_decl(_sub) 

class scoreboard extends uvm_scoreboard;
seq_itm1 data1;  //instance /hanlde for adder and subtractor  transaction class
seq_itm2 data2;
                                                    //uvm_analysis_imp or tim_analysis_fifo
uvm_analysis_imp_add #(seq_itm1,scoreboard) add_aip; //uvm_analysis_imp i.e circle and two arguments trans & class where implimentation
uvm_analysis_imp_sub #(seq_itm2,scoreboard) sub_aip; //details are defining here is  scoreboard only  
  
`uvm_component_utils(scoreboard) //factory registration 
  
  //default constructor
  function new(string name,uvm_component parent);
    super.new(name,parent);
    add_aip=new("add_aip",this);//we creating or allocating memory for the implementation ports
    sub_aip=new("sub_aip",this);//we creating or allocating memory for the implementation ports
  endfunction:new
  
  //build_phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    data1 = seq_itm1::type_id::create("data1");//object adder transaction class
    data2=seq_itm2::type_id::create("data2"); //object for subtractor transaction class
  endfunction:build_phase
  
//ap has write method which is non_blocking in nature i.e function
  //so unique write method for adder i.e write_add and for subtractor is write_sub
  
  virtual function void write_add(input seq_itm1 t);//implementation details for adder
   //data1=t;//storing "t" into data1
    `uvm_info(get_type_name(),"data received from addr_monitor ap",UVM_NONE)
    t.print(); //just print transactions
    if(t.a >= 0 && t.b >= 0) begin:B1  //if >= 0 means valid xtn
      if(t.y == t.a + t.b) begin:B2
        `uvm_info(get_type_name(),"TEST IS PASSED",UVM_NONE)
        t.print();
      end:B2
      else begin:B3
        `uvm_info(get_type_name(),"TEST IS FAILED",UVM_NONE) 
        t.print();
      end:B3
      
    end:B1 
    else return;//if x or z return out of this method(i.e write_add);
    
  endfunction:write_add
  
  
  virtual function void write_sub(input seq_itm2 t);
     //data2=t;
    `uvm_info(get_type_name(),"data received from the sub_monitor ap",UVM_NONE)
     t.print(); //just print transactions
    if(t.m >= 0 && t.n >= 0 ) begin:B1
      if(t.z ==  t.m -t.n) begin:B2
        `uvm_info(get_type_name(),"TEST IS PASSED",UVM_NONE)
        t.print();
      end:B2
      
      else begin:B3
        `uvm_info(get_full_name,"TEST IS FAILED",UVM_NONE)
        t.print();
      end:B3
      
    end:B1
    else return; //if x or z return out of this method (i.e write_sub) [if it returns x or z it exits)
  endfunction:write_sub
  
endclass:scoreboard