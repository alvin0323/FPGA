//synopsys translate_off
`timescale 1ps/1ps
//synopsys translate_on
module exercise3(KEY,SW,LEDR,HEX0,HEX1,HEX2,HEX3);
input [3:0]KEY;
input [9:0]SW;
output [9:0]LEDR;
output [6:0]HEX0,HEX1,HEX2,HEX3;
reg [7:0]A,B,C,D=0;
wire [15:0]mult1,mult2,sum;
wire [7:0]in;
wire clk,rst;
wire K;
reg [3:0]IN4,IN3,IN2,IN1;
assign clk = KEY[1];
assign rst = KEY[0];
assign in = SW[7:0];
always @(negedge clk or negedge rst) begin
	if(!rst)
		A <= 0;
	else
	begin
		if(SW[9] && SW[8] && KEY[2])
			A <= in;
		else
			A <= A;
	end
end
always @(negedge clk or negedge rst) begin
	if(!rst)
		B <= 0;
	else
	begin
		if(SW[9] && SW[8] && !KEY[2])
			B <= in;
		else
			B <= B;
	end
end
always @(negedge clk or negedge rst) begin
	if(!rst)
		C <= 0;
	else
	begin
		if(SW[9] && !SW[8] && KEY[2])
			C <= in;
		else
			C <= C;
	end
end
always @(negedge clk or negedge rst) begin
	if(!rst)
		D <= 0;
	else
	begin
		if(SW[9] && !SW[8] && !KEY[2])
			D <= in;
		else
			D <= D;
	end
end
always @(*) begin
	if(!KEY[0])
		IN4 = 0;
	else if(SW[8] && KEY[3])
	begin
		IN4 = A>>4;
	end
	else if(!SW[8] && KEY[3])
	begin
		IN4 = C>>4;
	end
	else if(!KEY[3])
	begin
		IN4 = sum >> 12;
	end
	else
	begin
		IN4 = 0;
	end
end
always @(*) begin
	if(!KEY[0])
		IN3 = 0;
	else if(SW[8] && KEY[3])
	begin
		IN3 = (A<<4)>>4;
	end
	else if(!SW[8] && KEY[3])
	begin
		IN3 = (C<<4)>>4;
	end
	else if(!KEY[3])
	begin
		IN3 = sum/256 - IN4*16;
	end
	else
	begin
		IN3 = 0;
	end
end
always @(*) begin
	if(!KEY[0])
		IN2 = 0;
	else if(SW[8] && KEY[3])
	begin
		IN2 = B>>4;
	end
	else if(!SW[8] && KEY[3])
	begin
		IN2 = D>>4;
	end
	else if(!KEY[3])
	begin
		IN2 = sum/16 - IN3*16 - IN4*256;
	end
	else
	begin
		IN2 = 0;
	end
end
always @(*) begin
	if(!KEY[0])
		IN1 = 0;
	else if(SW[8] && KEY[3])
	begin
		IN1 = (B<<4)>>4;
	end
	else if(!SW[8] && KEY[3])
	begin
		IN1 = (D<<4)>>4;
	end
	else if(!KEY[3])
	begin
		IN1 = (sum << 12) >> 12;
	end
	else
	begin
		IN1 = 0;
	end
end

assign LEDR[9] = K;
lpm_mult16(.dataa(A),.datab(B),.result(mult1));
lpm_mult16(.dataa(C),.datab(D),.result(mult2));
lpm_add16(.dataa(mult1),.datab(mult2),.overflow(K),.result(sum));
seven(IN4,HEX3);
seven(IN3,HEX2);
seven(IN2,HEX1);
seven(IN1,HEX0);
endmodule

module seven(in,out);
input [3:0]in;
output [6:0]out;
assign out[0] = (in==4'd1 | in==4'd4 | in==4'd11 | in==4'd13)?1:0;
assign out[1] = (in==4'd5 | in==4'd6 | in==4'd11 | in==4'd12 | in==4'd14 | in==4'd15)?1:0;
assign out[2] = (in==4'd2 | in==4'd12 | in==4'd14 | in==4'd15)?1:0;
assign out[3] = (in==4'd1 | in==4'd4 | in==4'd7 | in==4'd9 | in==4'd10 | in==4'd15)?1:0;
assign out[4] = (in==4'd0 | in==4'd2 | in==4'd6 | in==4'd8 | in==4'd10 | in==4'd11 | in==4'd12 | in==4'd13 | in==4'd14 | in==4'd15)?0:1;
assign out[5] = (in==4'd1 | in==4'd2 | in==4'd3 | in==4'd7 | in==4'd13)?1:0;
assign out[6] = (in==4'd0 | in==4'd1 | in==4'd7 | in==4'd12)?1:0;
endmodule

module lpm_add16(dataa,datab,overflow,result); 
 input [15:0] dataa;
 input [15:0] datab;
 output overflow;
 output [15:0] result;
 wire sub_wire0;
 wire [15:0]sub_wire1;
 wire [15:0] result=sub_wire1[15:0];
 wire [16:0] sum;
 assign sum = dataa + datab;
 assign overflow = sum[16];
 lpm_add_sub lpm_add_sub_component(
  .dataa(dataa),
  .datab(datab),
  .overflow(sub_wire0),
  .result(sub_wire1)
  //synopsys translate_off
  ,
  .alcr(),
  .add_sub(),
  .cin(),
  .clken(),
  .clock(),
  .cout()
  //synopsys translate_on
  );
 defparam
  lpm_add_sub_component.lpm_direction="ADD",
  lpm_add_sub_component.lpm_hint="ONE_INPUT_IS_CONSTANT=NO,CIN_USED=N0",
  lpm_add_sub_component.lpm_type="LPM_ADD_SUB",
  lpm_add_sub_component.lpm_width=16;
  endmodule

module lpm_mult16(dataa,datab,result); 
 input [7:0] dataa;
 input [7:0] datab;
 output [15:0] result;
 wire [15:0] sub_wire0;
 wire [15:0] result=sub_wire0[15:0];
 lpm_mult lpm_mult_component(
  .dataa(dataa),
  .datab(datab),
  .result(sub_wire0),
  .sum(1'b0),
  .clken(1'b1),
  .clock(1'b0));
 defparam
  lpm_mult_component.lpm_hint="MAXIMIZE_SPEED=5",
  lpm_mult_component.lpm_representation="UNSIGNED",
  lpm_mult_component.lpm_type="LPM_MULT",
  lpm_mult_component.lpm_widtha=8,
  lpm_mult_component.lpm_widthb=8,
  lpm_mult_component.lpm_widthp=16,
  lpm_mult_component.lpm_widths=1;
endmodule