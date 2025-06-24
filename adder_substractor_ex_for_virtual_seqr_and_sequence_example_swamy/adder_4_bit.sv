// Code your design here
//`begin_keywords "1800-2017"    //LRM 1800-2017
//timeunit 1ns; timeprecision 1ns;

module adder( input logic aclk,arst,
              input logic[3:0] a,b,
              output logic[4:0] y);


 always_ff @(posedge aclk) begin:B1  //syn reset with clock
   
   if(arst) begin
   y <= 5'b0_0000;
   end
   
   else begin
   y <= a+b;
   end
   
 end:B1
  
endmodule:adder
//`end_keywords