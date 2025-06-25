

class user_test extends uvm_test;
  
  //factory registration
  `uvm_component_utils(user_test)
  
  //user defind component handle define
  user_component user1;
  
  //default constructor
  function new(string name,uvm_component parent);
    super.new(name,parent);  
  endfunction:new
  
  //build_phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // i am creating the user_component.
    user1=user_component::type_id::create("user1",this);
    if(user1 != null) begin
      $display("\n=================================================");
      $display("============user1 object is created ===============");
      $display("====================================================");
    end
  endfunction:build_phase
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #50;
    $display("\n\n=============TIME:%0T  i am deallocating the object \"user1 \"==============",$time);
    user1=  null ;

    $display("=======================user1 is:%0s========================== " , ( user1 == null ) ? "null" : "non_null" ) ;

    //it gives an error num object access if did you do the "user1=null" 
    $display("\n======After deallocation of user1 objet =========================");
    user1.data=10;
    $display("=========== user1.data=%0d================",user1.data);
    
      phase.drop_objection(this);
  endtask:run_phase
  
endclass:user_test