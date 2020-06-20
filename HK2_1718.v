module HK2_1718(clk,PulseIn, MODE,D);
	input clk, PulseIn;
	input MODE;
	output [15:0]D;
	reg prePul=0;
	reg [7:0]count2=0;
	reg [15:0]count=16'h0000, D=16'h0000,demxung=16'h0000;
	always @(posedge clk) begin
		prePul<=PulseIn; 
		count<=count+1;
		if ({prePul,PulseIn}==2'b01) 
			demxung<=demxung+1;
		if (MODE==0) begin
			if (count>=9999) begin
				D<=demxung;
				count<=0;
				demxung<=0;
				count2<=0;
			end
		end
		else begin
			if (count>=9999) begin
				count2<=count2+1;
				count<=0;
				if (count2>=99) begin
					D<=demxung;
					demxung<=0;
					count2<=0;
				end
			end
		end
	end
endmodule
