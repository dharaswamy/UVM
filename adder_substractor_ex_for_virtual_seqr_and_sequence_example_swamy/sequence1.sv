//---------------------------------sequence class----------------------------
//sequence class-parameterize class,parameterize with type of transaction (dat object in this case seq_item)
//genertor in SV :- generates random sequence and send to the driver
//start_item(trans);signifies that new transaction is there
//sequence:- object class in UVMCH,where actual xtn is going to be generate,for verifying any design comletely and get 100
//function  :coverage we need to have multiple sequences bcz one sequence is capable of generating only one kind of xtn.
//generate stimulus based on given constraints
//can be generated on the fly or at time zero
//sequncences cand be nested i.e one sequence can be made oas a part of other sequence
//override sequeces using factory
//to create a sequence
//extend fromeuvm_sequence
//user code in task methods i.e pre_body(),body(),and post_body();

//note:-sequencel is for adder

class sequence1 extends uvm_sequence#(seq_itm1);
//factory registration
  `uvm_object_utils(sequence1)
  
  //default constructor
  function new(input string name="sequence1"); //object class in UVM_BCH HENCE ONE ARGUMENT
    super.new(name);                           //Object dynamic in nature which can be create and deleted
  endfunction:new                              //so req(request) is built in xtn object and rst(response) also
                                                //req=transaction ::type_id::create("req");
  
  
virtual task body(); //virtual body task w/o any arguments
 // req=seq_itm1::type_id::create("req");
  repeat(5) begin:B1
   // start_item(req);  //waiting for request from driver i.e start_seq_item(req);
                      //to start communication i.e start_item blocking in nature
                     //proper handshaking between driver and seqr
    
   // void'(req.randomize()); //generating xtn,pesudo random number
    //req.rst='0;             //deassertion of rst;
    //`uvm_info(get_type_name(),"Data_send to driver",UVM_NONE);
    //req.print();
   // finish_item(req);
    
    `uvm_do(req);
    `uvm_info(get_type_name(),"Data send to driver",UVM_NONE);
    req.print();
    //`uvm_do_with(req,{req.constrinat if any;});
    //instead of void'(req.randomize() with {address==10;data==20;});
  end:B1
    
    
endtask:body
  
endclass:sequence1