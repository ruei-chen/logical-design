module jkff(  //jk flip flop to set counter
    input j,
    input k,
    input clk,
    output reg q
);
initial begin
  q=0;
end

always @(posedge clk)begin //set value
  case({j,k})
	2'b00 : q<=q;   //hold
      	2'b01 : q<=0;   //reset
      	2'b10 : q<=1;   //set
      	2'b11 : q<=~q;  //toggle
  endcase
end

endmodule
