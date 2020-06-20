module HK1_1718(clk,PULSEIN, MODE,D);
	input clk, PULSEIN;
	input [1:0]MODE;
	output [15:0]D;
	reg prePul=0;
	reg [1:0]mode1=2'b01;
	reg [15:0]count=16'h0000, D=16'h0000;
	always @(posedge clk) begin
		prePul<=PULSEIN; 
		count<=count+1;
		if ({prePul,PULSEIN}==2'b01) begin
			if (mode1>=MODE) begin
				D<=count;
				count<=16'h0001;
				mode1<=1;
			end
			else 
				mode1<=mode1+1;
		end
	end
endmodule
