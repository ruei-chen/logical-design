module seven_display( 
    input clk,k,
    output reg[3:0] num,
    output reg[6:0] a,b);//a->tens digit , b->units digit

wire [3:0] in;
wire in0,in1,in2,in3;

counter  s1(clk,in0,in1,in2,in3);
over     s2(clk,k,in0,in1,in2,in3,in);

initial begin
a=7'b1111110;
b=7'b1111110;
end

//sevenROM
always @(*)
begin
case(in)//number change to Seven-segment display
    4'b0000 : begin a=7'b1111110; b=7'b1111110; end//0
    4'b0001 : begin a=7'b1111110; b=7'b0110000; end//1
    4'b0010 : begin a=7'b1111110; b=7'b1101101; end//2
    4'b0011 : begin a=7'b1111110; b=7'b1111001; end//3
    4'b0100 : begin a=7'b1111110; b=7'b0110011; end//4
    4'b0101 : begin a=7'b1111110; b=7'b1011011; end//5
    4'b0110 : begin a=7'b1111110; b=7'b1011111; end//6
    4'b0111 : begin a=7'b1111110; b=7'b1110000; end//7
    4'b1000 : begin a=7'b1111110; b=7'b1111111; end//8
    4'b1001 : begin a=7'b1111110; b=7'b1110011; end//9
    4'b1010 : begin a=7'b0110000; b=7'b1111110; end//10 
    4'b1011 : begin a=7'b0110000; b=7'b0110000; end//11
    4'b1100 : begin a=7'b0110000; b=7'b1101101; end//12
    4'b1101 : begin a=7'b0110000; b=7'b1111001; end//13
    4'b1110 : begin a=7'b0110000; b=7'b0110011; end//14
    4'b1111 : begin a=7'b0110000; b=7'b1011011; end//15
endcase
end
//sevendecoder
reg [3:0]n;
always@(*)
begin//change Seven-segment display to number to show
if(a==7'b0110000)//1 for ten
  begin
    case(b)
      7'b1111110:n=4'b1010;//10
      7'b0110000:n=4'b1011;//11
      7'b1101101:n=4'b1100;//12
      7'b1111001:n=4'b1101;//13
      7'b0110011:n=4'b1110;//14
      7'b1011011:n=4'b1111;//15
     endcase
   end
if(a==7'b1111110)//0 for ten
  begin
    case(b)
      7'b1111110:n=4'b0000;//0
      7'b0110000:n=4'b0001;//1
      7'b1101101:n=4'b0010;//2
      7'b1111001:n=4'b0011;//3
      7'b0110011:n=4'b0100;//4
      7'b1011011:n=4'b0101;//5
      7'b1011111:n=4'b0110;//6
      7'b1110000:n=4'b0111;//7
      7'b1111111:n=4'b1000;//8
      7'b1110011:n=4'b1001;//9
    endcase
  end

assign num=n;

end
endmodule
