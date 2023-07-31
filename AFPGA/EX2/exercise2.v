module exercise2(CLOCK50,SW,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input [9:0]SW;
input CLOCK50;//inside clock
output [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
reg [5:0] second,min_o;
wire[5:0] second_wire;
wire [5:0] minute;
reg [4:0]hour_o;
wire [4:0]hour;
reg reset;
assign second_wire = second;
wire [3:0]h2,h1,m2,m1,s2,s1;
wire clk;
parameter IDLE = 2'd0;
parameter S0 = 2'd1;
parameter S1 = 2'd2;
reg [1:0]current = IDLE;
reg [1:0]next;
FrequencyDivider50MHz(CLOCK50,clk);
always@(posedge clk or posedge reset)
begin
if(reset)
	current <= S1;
else
	current <= next;
end

always@(*)
begin
	case(current)
		IDLE : 
		begin
			if(SW[8])
				next = S0;
			else
				next = IDLE;
		end
		S0 : 
		begin
			next = S1;
		end
		S1 :
		begin
			if(!SW[8])
				next = IDLE;
			else
				next = S1;
		end
		default : next = IDLE;
	endcase
end

always@(posedge clk)//reset block
begin
	if(hour==23 && minute==59 && second==59)
		reset <= 1;
	else
		reset <= 0;
end
always @(*) 
begin
	if(next == S0&&SW[9])
		hour_o = SW[7:0];
	else
	begin
		hour_o = hour;
	end
end
min (.clock(clk),.rst(reset),.n_s(next),.switch(SW[9]),.in(SW[7:0]),.sec(second),.out(minute));//minute module
hhh (.clock(clk),.rst(reset),.n_s(next),.switch(SW[9]),.in(SW[7:0]),.minute(minute),.sec(second),.out(hour));//hour module
always @(*) 
begin
	if(next == S0&&!SW[9])
		min_o = SW[7:0];
	else
	begin
		min_o = minute;
	end
end
always@(posedge clk or posedge reset)//second block
begin
if(reset)
	second <= 0;
else
begin
	if(second == 59)
		second <= 0;
	else
		second <= second + 1;
end
end

assign h2 = hour_o/10;
assign h1 = hour_o%10;
assign m2 = min_o/10;
assign m1 = min_o%10;
assign s2 = second/10;
assign s1 = second%10;
seven(s2,HEX1);
seven(s1,HEX0);
seven(m2,HEX3);
seven(m1,HEX2);
seven(h2,HEX5);
seven(h1,HEX4);
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

module FrequencyDivider50MHz(clk_50MHz,clk_div);
  input  clk_50MHz;
  output reg clk_div;
  reg [25:0] counter;  
  parameter n = 25000000;  
  always @(posedge clk_50MHz) 
  begin
    if (counter == n - 1) 
	 begin
      counter <= 0;
      clk_div <= ~clk_div;
    end 
	 else 
	 begin
      counter <= counter + 1;
    end
  end

endmodule
module min (clock,rst,n_s,switch,in,sec,out);
input clock;
input rst;
input switch;
input [1:0] n_s;
input [7:0] in;
input [5:0] sec;
output reg [5:0] out;
always@(posedge clock or posedge rst)//minute block
begin
if(rst)
	out <= 0;
else
begin
	if(n_s == 2'd1 &&!switch)
		out <= in;
	else
	begin
		if(sec == 59)
		begin
			if(out == 59)
				out <= 0;
			else
				out <= out + 1;
		end
		else
			out <= out;
	end
end
end
endmodule
module hhh(clock,rst,n_s,switch,in,minute,sec,out);
input clock;
input rst;
input switch;
input [1:0] n_s;
input [7:0] in;
input [5:0] sec;
input [5:0] minute;
output reg [4:0] out;
always@(posedge clock or posedge rst)//hour block
begin
if(rst)
	out <= 0;
else
begin
	if(n_s == 2'd1 && switch)
		out <= in;
	else
	begin
		if(minute == 59 && sec == 59)
		begin
			if(out == 23)
				out <= 0;
			else
				out <= out + 1;
		end
		else
			out <= out;
	end
end
end
endmodule


