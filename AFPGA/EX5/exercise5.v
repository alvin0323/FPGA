module exercise5(CLOCK_50,SW,LEDR,HEX0,HEX1,HEX2,HEX3);
    input CLOCK_50;
    input [9:0]SW;
    output [1:0]LEDR;
    output [6:0]HEX0,HEX1,HEX2,HEX3;
    wire clk;
    wire [7:0] out;
    wire [3:0]A1,A2,O1,O2;
    wire [5:0] address;
    FrequencyDivider50MHz(CLOCK_50,clk);
    ramlpm(.address(SW[4:0]),.clock(clk),.data(SW[7:0]),.wren(SW[9]),.q(out),.address_o(address),.write_o(LEDR[0]));
    assign A2 = address/16;
    assign A1 = address%16;
    assign O2 = out/16;
    assign O1 = out%16;
    seven(A2,HEX3);
    seven(A1,HEX2);
    seven(O2,HEX1);
    seven(O1,HEX0);
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
