module fulladder(
   input A,B,
   input Ci,
   output S,
   output Co);
//fulladder circuit
wire w1,w2,w3,w4;
xor g1(w1,A,B);
xor g2(S,w1,Ci);
or  g3(w2,B,Ci);
and g4(w3,w2,A);
and g5(w4,B,Ci);
or  g6(Co,w3,w4);

endmodule

module counter(
    input clk,
    output q0,q1,q2,q3
);
wire q0bar,q1bar,q2bar;
wire C1,C2,C3,C4;
wire [3:0]q;
//generate the cycling number to ROM 
jkff f1(1,1,clk,q[0]);
jkff f2(1,1,q0bar,q[1]);
jkff f3(1,1,q1bar,q[2]);
jkff f4(1,1,q2bar,q[3]);
not  f5(q0bar,q[0]);
not  f6(q1bar,q[1]);
not  f7(q2bar,q[2]);
fulladder  f8(q[0], 0,  0, q0, C1);
fulladder  f9(q[1], 1, C1, q1, C2);
fulladder f10(q[2], 0, C2, q2, C3);
fulladder f11(q[3], 0, C3, q3, C4);

endmodule 
