//`begin_keywords "1800-2017"
//timeunit 1ns ;
//timeprecision 1ns;

module subtractor(input logic sclk,srst,
                   input logic[3:0] m,n,
                   output logic[4:0] z);
  
  
  always_ff @(posedge sclk) begin:B1 //synchronous reset with clk
    
    if(srst) begin
      z <= 5'b0_0000;
    end
    
    else begin
      z <= m-n;
    end
    
    
  end:B1
  
endmodule:subtractor




//`end_keywords