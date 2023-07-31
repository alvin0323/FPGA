module exercise6(KEY,LEDR,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
    input [2:0]KEY;
    output [7:0]LEDR;
    output [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
    reg [4:0] counter = 0;
    wire[7:0] DIN;
    wire[7:0]R0,R1;
    wire[3:0]A1,A0,B1,B0;
	reg[3:0]D2,D1;
    reg D_flag;
    wire Resetn,MCLOCK,PCLOCK;
    assign Resetn = KEY[0];
    assign MCLOCK = KEY[1];
    assign PCLOCK = KEY[2];

    always @(negedge MCLOCK or negedge Resetn)//counter block
    begin
        if(!Resetn)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    ROM_1(.address(counter),.clock(!MCLOCK),.q(DIN));

    proc(.DIN(DIN),.Resetn(Resetn),.Clock(PCLOCK),.R0(R0),.R1(R1),.BusWires(LEDR));
    always@(negedge MCLOCK or negedge Resetn)
	begin
        if(!Resetn)
            D_flag <= 0;
        else
            D_flag <= 1;
	end
    assign A1 = R0/16;
    assign A0 = R0%16;
    assign B1 = R1/16;
    assign B0 = R1%16;
	 always@(*)
	 begin
		if(!D_flag)
			D2 = 0;
		else
			D2 = DIN/16;
	 end
	 always@(*)
	 begin
		if(!D_flag)
			D1 = 0;
		else
			D1 = DIN%16;
	 end
    seven(D2,HEX5);
    seven(D1,HEX4);
    seven(A1,HEX3);
    seven(A0,HEX2);
    seven(B1,HEX1);
    seven(B0,HEX0);
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

module proc(DIN,Resetn,Clock,R0,R1,BusWires);
input[7:0]DIN;
input Resetn,Clock;
output [7:0] R0,R1;
output reg [7:0] BusWires;
reg [7:0] IR;
reg cal_flag;
reg [7:0]Register[7:0];
integer i;

always @(negedge Clock or negedge Resetn) 
begin
    if(!Resetn)
        cal_flag <= 0;
    else
    begin
        if(cal_flag)
            cal_flag <= 0;
        else if(DIN[7:6]==2'b01)
            cal_flag <= 1;
        else 
            cal_flag <= cal_flag;
    end
end

always @(negedge Clock or negedge Resetn) 
begin
    if(!Resetn)
        BusWires <= 0;
    else
        BusWires <= DIN;  
end

always @(negedge Clock or negedge Resetn) 
begin
    if(!Resetn)
        IR <= 0;
    else
    begin
        IR <= DIN;
    end
end

always @(negedge Clock or negedge Resetn ) 
begin
    if(!Resetn)    
    begin
        for ( i=0 ; i<8 ; i=i+1 ) 
        begin
            Register[i] <= 0;
        end
    end
    else
    begin
        if(cal_flag == 0)
        begin
            case (DIN[7:6])
            2'b00 : 
            begin
                Register[DIN[5:3]] <= Register[DIN[2:0]];
            end
            2'b10 :
            begin
                Register[DIN[5:3]] <= Register[DIN[2:0]] + Register[DIN[5:3]];
            end
            2'b11 :
            begin
                Register[DIN[5:3]] <= Register[DIN[5:3]] - Register[DIN[2:0]];
            end
            default :
            begin
                for ( i=0 ; i<8 ; i=i+1 ) 
                begin
                    Register[i] <= Register[i];
                end
            end 
            endcase
        end
        else
        begin
            Register[IR[5:3]] <= DIN;
        end
    end
end
assign R0 = Register[0];
assign R1 = Register[1];
endmodule
