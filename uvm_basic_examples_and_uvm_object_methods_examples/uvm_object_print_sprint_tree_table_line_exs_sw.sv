

// eda link : https://edaplayground.com/x/SBbu 

// ( swamy ) please copy the code but don't change/modify the code here.


//====================================================================================================

//=========================uvm_object base class methods and uvm basics================================

//i.uvm_object methods -> i.print,ii.sprint,ii.create object but class didn't register with factory.

//ii.table form,tree_form,line_form" using uvm_table_printer,uvm_tree_printer,uvm_line_printer class.

//iii.flags "UVM_DEC,UVM_BIN,UVM_OCT,UVM_HEX,UVM_REAL,UVM_TIME ","UVM_ALL_ON ,UVM_NOCOPY,UVM_NOCOMPARE"

//======================================================================================================



`include "uvm_macros.svh"

import uvm_pkg::*;


//--------------------------------------------------------------------------------------

/*
//Ex1a:basic example of the "print" method ,it print the object properties ,but it only prints the whatever the properties are registered with factory .
//in this example data_out is not registered with factory so"trans.print" it does not prints the value of data_out.


class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  
  //note data_out property is not registered with factory.
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_field_int(wr_en,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing ==========");
    trans.print();
    $display("==========After randomize object printing ==========");
    void'(trans.randomize());
    trans.print();
    
  end
  
endmodule:tb

//simulation output:
//Note observe trans.print it prints object propertyes ,here the "data_out" didn't print because "the data_out" field is not register with factory.

// ==========before randomize object printing ==========
// -----------------------------------
// Name       Type         Size  Value
// -----------------------------------
// trans      transaction  -     @336 
//   addr     integral     8     'h0  
//   data_in  integral     8     'h0  
//   wr_en    integral     1     'h0  
// -----------------------------------
// ==========After randomize object printing ==========
// -----------------------------------
// Name       Type         Size  Value
// -----------------------------------
// trans      transaction  -     @336 
//   addr     integral     8     'hb9 
//   data_in  integral     8     'h6c 
//   wr_en    integral     1     'h1  
// -----------------------------------
//            V C S   S i m u l a t i o n   R e p o r t 

*/

//Ex1a:basic example of the "print" method ,it print the object properties ,but it only prints the whatever the properties are registered with factory .
//in this example data_out is also registered with factory so"trans.print" it prints the value of data_out.

/*
class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_field_int(wr_en,UVM_ALL_ON)
  `uvm_field_int(data_out,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing ==========");
    trans.print();
    $display("==========After randomize object printing ==========");
    void'(trans.randomize());
    trans.print();
    
  end
  
endmodule:tb


//simulation output:
//Note observe trans.print it prints object propertyes ,here the "data_out"  also printed because it registerd with factory.


// ==========before randomize object printing ==========
// ------------------------------------
// Name        Type         Size  Value
// ------------------------------------
// trans       transaction  -     @336 
//   addr      integral     8     'h0  
//   data_in   integral     8     'h0  
//   wr_en     integral     1     'h0  
//   data_out  integral     8     'h0  
// ------------------------------------
// ==========After randomize object printing ==========
// ------------------------------------
// Name        Type         Size  Value
// ------------------------------------
// trans       transaction  -     @336 
//   addr      integral     8     'hb9 
//   data_in   integral     8     'h6c 
//   wr_en     integral     1     'h1  
//   data_out  integral     8     'h0  
// ------------------------------------
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:      0.420 seconds;       Data structure size:   0.1Mb
// Tue Dec  5 07:20:59 2023
// Done

*/



/*
//Ex1c :  In this example ,i have registered my class with factory but class property is not registered with factory.so if i "print" object using "pint()" method ,it only prints the class handle see simulator output.

class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  
  `uvm_object_utils(transaction)
  
  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing ==========");
    trans.print();
    $display("==========After randomize object printing ==========");
    void'(trans.randomize());
    trans.print();
    
  end
  
endmodule:tb


//Simulator output: 
//observe here trans.print() ,printed the factory registered class propertyes,in this example all propertyes didn't register with factory so it prints only "trans" handle  because class registered with factory.

// ==========before randomize object printing ==========
// -------------------------------
// Name   Type         Size  Value
// -------------------------------
// trans  transaction  -     @1799
// -------------------------------
// ==========After randomize object printing ==========
// -------------------------------
// Name   Type         Size  Value
// -------------------------------
// trans  transaction  -     @1799
// -------------------------------
// xmsim: *W,RNQUIE: Simulation is complete.
// xcelium> exit
// TOOL:	xrun	20.09-s003: Exiting on Dec 05, 2023 at 07:43:31 EST  (total: 00:00:06)
// Done

*/


//EX1d: in this example i am printing the my object propertyes values in decimal form using "UVM_DEC ",IF not speicify anything it prints in hexa decimal form by defaultly.

/*
class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;

  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
   
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON +UVM_DEC)
  `uvm_field_int(data_in,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(wr_en,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(data_out,UVM_ALL_ON+UVM_DEC)
  `uvm_object_utils_end
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing ==========");
    trans.print();
    $display("==========After randomize object printing ==========");
    void'(trans.randomize());
    trans.print();
    
  end
  
endmodule:tb

// simulator output:
// Observe: the values in decimal format
// ==========before randomize object printing ==========
// ------------------------------------
// Name        Type         Size  Value
// ------------------------------------
// trans       transaction  -     @1799
//   addr      integral     8     'd0  
//   data_in   integral     8     'd0  
//   wr_en     integral     1     'd0  
//   data_out  integral     8     'd0  
// ------------------------------------
// ==========After randomize object printing ==========
// ------------------------------------
// Name        Type         Size  Value
// ------------------------------------
// trans       transaction  -     @1799
//   addr      integral     8     'd80 
//   data_in   integral     8     'd8  
//   wr_en     integral     1     1    
//   data_out  integral     8     'd0  
// ------------------------------------
// xmsim: *W,RNQUIE: Simulation is complete.
// xcelium> exit
// TOOL:	xrun	20.09-s003: Exiting on Dec 05, 2023 at 08:16:01 EST  (total: 00:00:06)
// Done

*/


/*
//EX1E: in this example i am printing the my object propertyes values in decimal AND SOME propertyes specified as a real,time,string.

class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  time time_var =6;
  real real_var = 3.14142;
  string string_var="NGS HYD";
  

  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
   
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON +UVM_DEC)
  `uvm_field_int(data_in,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(wr_en,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(data_out,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(time_var,UVM_ALL_ON | UVM_TIME)//FORMAT Specifier si time
  `uvm_field_real(real_var,UVM_ALL_ON + UVM_REAL)//format specifier is "real"
  `uvm_field_string(string_var,UVM_ALL_ON )//format specifier is "string".
  `uvm_object_utils_end
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing ==========");
    trans.print();
    $display("==========After randomize object printing ==========");
    void'(trans.randomize());
    trans.print();
    
  end
  
endmodule:tb

//Simulator output:
//observe: time_var in printed in time format ,real_var printed in "real format",string_var is printed in "string format".

// =========before randomize object printing ==========
// -----------------------------------------
// Name          Type         Size  Value   
// -----------------------------------------
// trans         transaction  -     @1799   
//   addr        integral     8     'd0     
//   data_in     integral     8     'd0     
//   wr_en       integral     1     'd0     
//   data_out    integral     8     'd0     
//   time_var    time         64    6       
//   real_var    real         64    3.141420
//   string_var  string       7     NGS HYD 
// -----------------------------------------
// ==========After randomize object printing ==========
// -----------------------------------------
// Name          Type         Size  Value   
// -----------------------------------------
// trans         transaction  -     @1799   
//   addr        integral     8     'd80    
//   data_in     integral     8     'd8     
//   wr_en       integral     1     1       
//   data_out    integral     8     'd0     
//   time_var    time         64    6       
//   real_var    real         64    3.141420
//   string_var  string       7     NGS HYD 
// -----------------------------------------
// xmsim: *W,RNQUIE: Simulation is complete.
// xcelium> exit
// TOOL:	xrun	20.09-s003: Exiting on Dec 05, 2023 at 08:31:11 EST  (total: 00:00:05)
// Done


*/


/*
//EX1f: in this example printing object in "table form,tree_form,line_form" using uvm_table_printer,uvm_tree_printer,uvm_line_printer class.


class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  time time_var =6;
  real real_var = 3.14142;
  string string_var="NGS HYD";
  

  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
   
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON +UVM_DEC)
  `uvm_field_int(data_in,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(wr_en,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(data_out,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(time_var,UVM_ALL_ON | UVM_TIME)//FORMAT Specifier si time
  `uvm_field_real(real_var,UVM_ALL_ON + UVM_REAL)//format specifier is "real"
  `uvm_field_string(string_var,UVM_ALL_ON )//format specifier is "string".
  `uvm_object_utils_end
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  uvm_tree_printer uvm_default_tree_printer =new();
  
  uvm_table_printer uvm_default_table_printer =new();
  
  uvm_line_printer uvm_default_line_printer =new();
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing in \" uvm_default_printer format \" ==========");
    trans.print();
    $display("==========1st time randomize object printing in \" uvm_table_printer \" ==========");
    void'(trans.randomize());
    trans.print(uvm_default_table_printer);
    $display("==========2nd time randomize object printing in \" uvm_tree_printer \" ==========");
    void'(trans.randomize());
    trans.print(uvm_default_tree_printer);
    
    $display("==========3rd time randomize object printing in \" uvm_line_printer \" ==========");
    void'(trans.randomize());
    trans.print( uvm_default_line_printer);
    $display(" ");
  end
  
endmodule:tb

*/

//================================================================================



//-----------------------------------------------------------------------------------------

//Ex2 :you look at the create method->  trans = transaction::type_id::create("tr") here the "handle name is "trans" but in create() arguments i am passing "tr" ",so internal object name"tr" printed in trans.print().
//so handle name and argument name in create() method no problem.

/*
class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_field_int(wr_en,UVM_ALL_ON)
  `uvm_field_int(data_out,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  
  initial begin
    trans = transaction::type_id::create("tr");
    $display("==========before randomize object printing ==========");
    trans.print();
    $display("==========After randomize object printing ==========");
    void'(trans.randomize());
    trans.print();
    
  end
  
endmodule:tb

//Simulator output: 
//observe here " Name "tr" for transaction class in below table.

// =========before randomize object printing ==========
// ------------------------------------
// Name        Type         Size  Value
// ------------------------------------
// tr          transaction  -     @1799
//   addr      integral     8     'h0  
//   data_in   integral     8     'h0  
//   wr_en     integral     1     'h0  
//   data_out  integral     8     'h0  
// ------------------------------------
// ==========After randomize object printing ==========
// ------------------------------------
// Name        Type         Size  Value
// ------------------------------------
// tr          transaction  -     @1799
//   addr      integral     8     'h50 
//   data_in   integral     8     'h8  
//   wr_en     integral     1     'h1  
//   data_out  integral     8     'h0  
// ------------------------------------
// xmsim: *W,RNQUIE: Simulation is complete.
// xcelium> exit
// TOOL:	xrun	20.09-s003: Exiting on Dec 05, 2023 at 08:08:34 EST  (total: 00:00:06)
// Done

*/
//======================================================================================================





//-----------------------------------------------------------------------------------------

//Ex3: i am not registering my class with factory but creating the object using "create()" method.it gives an error "type check error" not compatiable type assignment. 

/*
class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  
  // "transaction" class is not register with the factory and its propetyes also.
//   `uvm_object_utils_begin(transaction)
//   `uvm_field_int(addr,UVM_ALL_ON)
//   `uvm_field_int(data_in,UVM_ALL_ON)
//   `uvm_field_int(wr_en,UVM_ALL_ON)
//   `uvm_field_int(data_out,UVM_ALL_ON)
//   `uvm_object_utils_end
  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing ==========");
    trans.print();
    $display("==========After randomize object printing ==========");
    void'(trans.randomize());
    trans.print();
    
  end
  
endmodule:tb


// xrun: 20.09-s003: (c) Copyright 1995-2020 Cadence Design Systems, Inc.
// 	Top level design units:
// 		uvm_pkg
// 		$unit_0x4ccdf83b
// 		tb
// xmelab: *W,DSEMEL: This SystemVerilog design will be simulated as per IEEE 1800-2009 SystemVerilog simulation semantics. Use -disable_sem2009 option for turning off SV 2009 simulation semantics.
//     trans = transaction::type_id::create("trans");
//                                        |
// xmelab: *E,TYCMPAT (./testbench.sv,190|39): assignment operator type check failed (expecting datatype compatible with 'class $unit::transaction' but found 'class uvm_pkg::uvm_sequence_item' instead).
// xrun: *E,ELBERR: Error during elaboration (status 1), exiting.

*/

//======================================================================================================





//-----------------------------------------------------------------------------------------
//Ex 4: "sprint() method".

/*
class transaction extends uvm_sequence_item;
  
  rand bit [7:0] addr;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  
  bit [7:0] data_out;
  time time_var =6;
  real real_var = 3.14142;
  string string_var="NGS HYD";
  

  
  function new(string name ="transaction");
    super.new(name);
  endfunction:new
  
   
  `uvm_object_utils_begin(transaction)
  `uvm_field_int(addr,UVM_ALL_ON +UVM_DEC)
  `uvm_field_int(data_in,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(wr_en,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(data_out,UVM_ALL_ON+UVM_DEC)
  `uvm_field_int(time_var,UVM_ALL_ON | UVM_TIME)//FORMAT Specifier si time
  `uvm_field_real(real_var,UVM_ALL_ON + UVM_REAL)//format specifier is "real"
  `uvm_field_string(string_var,UVM_ALL_ON )//format specifier is "string".
  `uvm_object_utils_end
  
  
endclass:transaction


module tb;
  
transaction trans;
 
  uvm_tree_printer uvm_default_tree_printer =new();
  
  uvm_table_printer uvm_default_table_printer =new();
  
  uvm_line_printer uvm_default_line_printer =new();
  
  initial begin
    trans = transaction::type_id::create("trans");
    $display("==========before randomize object printing in \" uvm_default_printer format \" ==========");
    `uvm_info("sprint()" ,$sformatf("%0s",trans.sprint()),UVM_NONE)
    $display("==========1st time randomize object printing in \" uvm_table_printer \" ==========");
    void'(trans.randomize());
    `uvm_info("sprint()" ,$sformatf("%0s", trans.sprint(uvm_default_table_printer)),UVM_NONE)
    $display("==========2nd time randomize object printing in \" uvm_tree_printer \" ==========");
    void'(trans.randomize());
    `uvm_info("sprint()" ,$sformatf("%0s",trans.sprint(uvm_default_tree_printer)),UVM_NONE)
    
    $display("==========3rd time randomize object printing in \" uvm_line_printer \" ==========");
    void'(trans.randomize());
    `uvm_info("sprint()" ,$sformatf("%0s", trans.sprint( uvm_default_line_printer)),UVM_NONE)
   
    $display(" ");
  end
  
endmodule:tb

*/


//======================================================================================================





//-----------------------------------------------------------------------------------------




//======================================================================================================





//-----------------------------------------------------------------------------------------




//======================================================================================================




//-----------------------------------------------------------------------------------------




//======================================================================================================

