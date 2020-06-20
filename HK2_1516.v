module HK2_1516(clk, Tred, Tyellow, Tgreen, R1, Y1, G1, R2, Y2, G2);
	input clk ;
	input [5:0]Tred,Tyellow,Tgreen;
	output R1,G1,R2,G2,Y1,Y2;
	reg [7:0]count=0;
	reg [7:0]Yellow,Red1,Red2;
	reg R1=0,R2=0,G1=0,G2=0,Y1=0,Y2=0;
	always @(posedge clk) begin
		Yellow = Tgreen + Tyellow ;
		Red1 = Yellow + Tgreen;
		Red2 = Yellow + Tred;
		count<=count+1;
		if (count<=Tgreen) begin
			if (count>=Tyellow)   
				{G1,Y1,R1,G2,Y2,R2}=6'b100001;
		end
		else begin
			if (count<=Yellow)
				{G1,Y1,R1,G2,Y2,R2}=6'b010001;
			else begin
				if (count<=Red1)
					{G1,Y1,R1,G2,Y2,R2}=6'b001100;
				else begin
					if (count<=Red2)
						{G1,Y1,R1,G2,Y2,R2}=6'b001010;
					else begin
						{G1,Y1,R1,G2,Y2,R2}=6'b100001;
						count<=1;
					end
				end
			end
		end
	end
endmodule
