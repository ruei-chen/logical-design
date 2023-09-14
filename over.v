module over(//switch disappearing customer to next
   input clk,
   input k,//k to detect disappearing customer
   input in0,in1,in2,in3,   
   output reg [3:0]in);

wire C1,C2,C3,C4;
reg [3:0]inf;
reg [3:0]ink;
reg [3:0]ing;
//switch disappearing customer with the next
always @(posedge clk)
begin
ink[0]=in0;
ink[1]=in1;
ink[2]=in2;
ink[3]=in3;
in=ink+4'b0001;
if(k==1)//k=1 for disappearing customer
begin
ing=in;
in=ing+4'b0001;
end 
end

always @(k)
begin
if(k==0)//k=0 for normal situation
begin
inf=in;
in=inf-4'b0001;
end
end

endmodule 
