module exercise1(SW,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,LEDR);
input[17:0]SW;
output[6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
output[17:0]LEDR;
wire [3:0]A,B;
wire Cin;
wire [4:0]result;
wire [3:0]a1,a2,b1,b2,r1,r2;
assign A = SW[7:4];
assign B = SW[3:0];
assign Cin = SW[8];
Four_bit_FA(Cin,A[0],B[0],A[1],B[1],A[2],B[2],A[3],B[3],result[0],result[1],result[2],result[3],result[4]);
assign a2=A%10;
assign a1=A/10;
assign b2=B%10;
assign b1=B/10;
assign r2=result%10;
assign r1=result/10;
assign LEDR[9]=((A>9)|(B>9))?1:0;
assign LEDR[8:0] = 9'd0;
assign LEDR[17:10] = 8'd0;
seven(b2,HEX0);
seven(b1,HEX1);
seven(a2,HEX2);
seven(a1,HEX3);
seven(r2,HEX4);
seven(r1,HEX5);
endmodule

module Four_bit_FA(cin,a0,b0,a1,b1,a2,b2,a3,b3,s0,s1,s2,s3,cout);
input cin,a0,a1,a2,a3,b0,b1,b2,b3;
output s0,s1,s2,s3,cout;
wire c1,c2,c3;
FullAdder(cin,a0,b0,s0,c1);
FullAdder(c1,a1,b1,s1,c2);
FullAdder(c2,a2,b2,s2,c3);
FullAdder(c3,a3,b3,s3,cout);
endmodule

module FullAdder(ci,a,b,s,co);
input ci,a,b;
output s,co;
assign s=(!a&!b&ci)|(a&!b&!ci)|(!a&b&!ci)|(a&b&ci);
assign co=ci&(a^b)|(a&b&(ci|!ci));
endmodule

module seven(in,out);
input [3:0]in;
output [6:0]out;
assign out[0] = (in==4'd1 | in==4'd4)?1:0;
assign out[1] = (in==4'd5 | in==4'd6)?1:0;
assign out[2] = (in==4'd2)?1:0;
assign out[3] = (in==4'd1 | in==4'd4 | in==4'd7 | in==4'd9)?1:0;
assign out[4] = (in==4'd0 | in==4'd2 | in==4'd6 | in==4'd8)?0:1;
assign out[5] = (in==4'd1 | in==4'd2 | in==4'd3 | in==4'd7)?1:0;
assign out[6] = (in==4'd0 | in==4'd1 | in==4'd7)?1:0;
endmodule
