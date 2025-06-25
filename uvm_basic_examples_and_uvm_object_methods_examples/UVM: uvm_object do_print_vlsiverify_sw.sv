
// eda link : https://edaplayground.com/x/P7mz 

// ( swamy ) please copy the code but don't change/modify the code here. 

//=================================================================================================================================
						
// Topic Name:Example for uvm_object do_print method

//  i.do_print method in uvm (vlsi verify).
 
						
//=================================================================================================================================


// or browse Examples
`include "uvm_macros.svh"
import uvm_pkg::*;


//ref:vlsi verify.
typedef enum{RED, GREEN, BLUE} color_type;

class temp_class extends uvm_object;
  rand bit [7:0] tmp_addr;
  rand bit [7:0] tmp_data;
  
  function new(string name = "temp_class");
    super.new(name);
  endfunction
  
  `uvm_object_utils(temp_class)
    
  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("tmp_addr", tmp_addr, $bits(tmp_addr), UVM_HEX);
    printer.print_field_int("tmp_data", tmp_data, $bits(tmp_data), UVM_HEX);
  endfunction
endclass

class my_object extends uvm_object;
  rand int        value;
       string     names = "UVM";
  rand color_type colors;
  rand int      data[4];
  rand bit [7:0]  addr;
  rand temp_class tmp;
  
  `uvm_object_utils(my_object)
  
  function new(string name = "my_object");
    super.new(name);
    tmp = new();
  endfunction
  
  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("value", value, $bits(value), UVM_HEX);
    printer.print_string("names", names);
    printer.print_string("colors", colors.name);
    foreach(data[i])
      printer.print_field_int($sformatf("data[%0d]", i), data[i], $bits(data[i]), UVM_HEX);
    printer.print_field_int("addr", addr, $bits(addr), UVM_HEX);
    printer.print_object("tmp", tmp);
    printer.print_array_header("data",$bits(data),"data",UVM_HEX);
  endfunction
endclass

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_object obj;
  
  function new(string name = "my_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    obj = my_object::type_id::create("obj", this);
    assert(obj.randomize());
    obj.print();
  endfunction
endclass

module tb_top;
  initial begin
    run_test("my_test");
  end
endmodule
