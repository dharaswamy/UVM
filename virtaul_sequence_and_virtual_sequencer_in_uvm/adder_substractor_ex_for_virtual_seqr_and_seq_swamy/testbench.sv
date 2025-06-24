
// ( swamy ) please copy the code but don't change/modify the code here.


`include "uvm_macros.svh"

`include "adder_if.sv"
`include "sub_if.sv"
`include "base_test.sv"



`include "test_one.sv"

import uvm_pkg::*;
module top_tb();
 
//adder_if interface handle declaration
  adder_if avif();
//suv_if interface handle declaration
  sub_if svif();

  top dut( .aclk(avif.aclk),
           .arst(avif.arst),
           .sclk(svif.sclk),
           .srst(svif.srst),
           .a(avif.a),
           .b(avif.b),
           .m(svif.m),
           .n(svif.n),
           .y(avif.y),
           .z(svif.z)
           );
  
  initial begin:B1
    avif.aclk='0;//initialize aclk=0
    uvm_config_db#(virtual adder_if)::set(null,"*","virtual_adder_intf",avif);
    uvm_config_db#(virtual sub_if)::set(null,"*","virtual_subtractor_intf",svif);
    run_test("test_one");
   end:B1
  
  always #10 avif.aclk=~avif.aclk;
  assign svif.sclk=avif.aclk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule:top_tb