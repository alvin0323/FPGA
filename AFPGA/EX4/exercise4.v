module exercise4(SW,KEY,HEX0);
	input [2:0]SW;
	input [1:0]KEY;
	output [6:0]HEX0;
	wire clk,rst;
	wire [1:0]in;
	assign clk = KEY[0];
	assign rst = SW[0];
	assign in = {SW[2],SW[1]};
	reg [2:0] c_s,n_s;
	reg [3:0]count = 0;
	parameter IDLE = 3'd0,REMAIN = 3'd1,PLUS1 = 3'd2,PLUS2 = 3'd3,MINUS1 = 3'd4;
	always@(negedge clk)
	begin
		if(!rst)
			c_s <= IDLE;
		else
			c_s <= n_s;
	end
	always @(*) 
	begin
		if(!rst)
			n_s = IDLE;
		else
		begin
			case(c_s)
				3'd0 : 
				begin
					if(in == 2'b00)
						n_s = REMAIN;
					else if(in == 2'b01)
						n_s = PLUS1;
					else if(in == 2'b10)
						n_s = PLUS2;
					else
						n_s = MINUS1;
				end
				3'd1 :
				begin
					if(in == 2'b00)
						n_s = REMAIN;
					else if(in == 2'b01)
						n_s = PLUS1;
					else if(in == 2'b10)
						n_s = PLUS2;
					else
						n_s = MINUS1;
				end
				3'd2 :
				begin
					if(in == 2'b00)
						n_s = REMAIN;
					else if(in == 2'b01)
						n_s = PLUS1;
					else if(in == 2'b10)
						n_s = PLUS2;
					else
						n_s = MINUS1;
				end
				3'd3 :
				begin
					if(in == 2'b00)
						n_s = REMAIN;
					else if(in == 2'b01)
						n_s = PLUS1;
					else if(in == 2'b10)
						n_s = PLUS2;
					else
						n_s = MINUS1;
				end
				3'd4 :
				begin
					if(in == 2'b00)
						n_s = REMAIN;
					else if(in == 2'b01)
						n_s = PLUS1;
					else if(in == 2'b10)
						n_s = PLUS2;
					else
						n_s = MINUS1;
				end
				default :
				begin
					n_s = IDLE;
				end
			endcase
		end
	end
	always@(negedge clk) 
	begin
		case(n_s)
			IDLE : count <= 0;
			REMAIN : count <= count;
			PLUS1 :
			begin 
				if(count == 9)
					count <= 0;
				else
					count <= count + 1;
			end
			PLUS2 : 
			begin
				if(count == 8)
					count <= 0;
				else if(count == 9)
					count <= 1;
				else
					count <= count + 2;
			end
			MINUS1 : 
			begin
				if(count == 0)
					count <= 0;
				else
					count <= count - 1;
			end
			default : count <= 0;
		endcase
	end
	seven(count,HEX0);
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
