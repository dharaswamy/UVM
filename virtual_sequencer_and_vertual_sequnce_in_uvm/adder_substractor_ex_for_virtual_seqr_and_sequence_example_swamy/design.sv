`include "adder_4_bit.sv"
`include "subtractor_4_bit.sv"

//`begin_keywords "1800-2017"
module top( input logic aclk,arst,sclk,srst,
           input logic [3:0] a,b,m,n,
           output logic [4:0] y,z);

  adder a1(.aclk(aclk),.arst(arst),.a(a),.b(b),.y(y));
  
  subtractor s1(.sclk(sclk),.srst(srst),.m(m),.n(n),.z(z));
  
endmodule:top
//`end_keywords