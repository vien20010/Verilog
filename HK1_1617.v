module HK1_1617(ENCA,clk,D);
	input ENCA, clk;
	output [15:0]D;
	reg [15:0]D=16'h0000,temp=16'h0000,count=16'h0000;
	reg pre_enc;
	always @(posedge clk) begin
		pre_enc<=ENCA;
		count<=count+1;
		if ({pre_enc,ENCA}==2'b01)
			temp<=temp+1;
		if (count>=9999) begin
			D<=temp;
			count<=16'h0000;
			temp<=16'h0000;
		end
	end
endmodule
