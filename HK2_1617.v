module HK2_1617(clk, D, Start, LED_TR, LED_CH, LED_DV);
	input clk;
	input [7:0] D;
	output Start;
	output [6:0] LED_TR,LED_CH,LED_DV;
	reg [15:0] count= 0;
	reg [7:0] temp_D;
	reg [6:0] LED_TR = 7'h0,LED_CH = 7'h0,LED_DV = 7'h0;
	reg Start = 1'b0;
	reg [3:0] TR = 4'h0,CH = 4'h0,DV = 4'h0;
	always @(posedge clk)begin
		count<= count + 1;
		if(count == 0)
			Start = 1'b1;
		if (count >= 10)
			Start = 1'b0;
		if (count >= 50000) 
			count <= 0;
		if (count == 100) begin
			temp_D = D;
			TR = temp_D/100;
			CH = (temp_D%100)/10;
			DV = temp_D%10;
			case (TR)
				4'h0: 	LED_TR = 7'h3F;
				4'h1: 	LED_TR = 7'h06;
				4'h2: 	LED_TR = 7'h5B;
				4'h3: 	LED_TR = 7'h4F;
				4'h4: 	LED_TR = 7'h66;
				4'h5: 	LED_TR = 7'h6D;
				4'h6: 	LED_TR = 7'h3C;
				4'h7: 	LED_TR = 7'h07;
				4'h8: 	LED_TR = 7'h7F;
				4'h9: 	LED_TR = 7'h67;
				default: LED_TR = 7'hx;
			endcase
			case (CH)
				4'h0: 	LED_CH = 7'h3F;
				4'h1: 	LED_CH = 7'h06;
				4'h2: 	LED_CH = 7'h5B;
				4'h3: 	LED_CH = 7'h4F;
				4'h4: 	LED_CH = 7'h66;
				4'h5: 	LED_CH = 7'h6D;
				4'h6: 	LED_CH = 7'h3C;
				4'h7: 	LED_CH = 7'h07;
				4'h8: 	LED_CH = 7'h7F;
				4'h9: 	LED_CH = 7'h67;
				default: LED_CH = 7'hx;
				endcase
			case (DV)
				4'h0: 	LED_DV = 7'h3F;
				4'h1: 	LED_DV = 7'h06;
				4'h2: 	LED_DV = 7'h5B;
				4'h3: 	LED_DV = 7'h4F;
				4'h4: 	LED_DV = 7'h66;
				4'h5: 	LED_DV = 7'h6D;
				4'h6: 	LED_DV = 7'h3C;
				4'h7: 	LED_DV = 7'h07;
				4'h8: 	LED_DV = 7'h7F;
				4'h9: 	LED_DV = 7'h67;
				default: LED_DV = 7'hx;
			endcase
		end
	end
endmodule
