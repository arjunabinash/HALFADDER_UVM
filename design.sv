module half_adder(clk,in_a,in_b,ena,sum,carry);
 input clk;
 input in_a;
 input in_b;
 input ena;
 output reg sum;
 output reg carry;
  
  
always@(posedge clk) begin
   if(ena)begin
     sum<=0;
     carry<=0;
   end else 
     begin
     sum<= (in_a ^ in_b);
     carry<= (in_a & in_b);
    end   
 end
endmodule



