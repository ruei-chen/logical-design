module main//main function to implement the outcome
(
input clk,k,
output [3:0]count,
output [6:0]a,b,
output [3:0]num);

seven_display s1(clk,k,num,a,b);
counter       s2(clk,count[0],count[1],count[2],count[3]);

endmodule
