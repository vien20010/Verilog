module UltraSonic_Sensor(clk, EchoPulse, Trigger, D);
input clk, EchoPulse;
output Trigger;
output [15:0]D;
reg [15:0]D=16'h0000, count=16'h0001, temp=16'h0000;
reg pre_Echo=0;
reg Trigger;
always @(posedge clk) begin
    pre_Echo<=EchoPulse;
    temp<=temp+1;
    if (temp<1000)
    begin
        if (temp<10)
            Trigger<=1;
        else
            Trigger<=0;
    end
    else
        temp<=0;
    if (({pre_Echo,EchoPulse}==2'b11)&&(count<16'hffff))
    begin
        count<=count+1;
    end
    else if ({pre_Echo,EchoPulse}==2'b10)
    begin
        D<=count;
        count<=16'h0001;
    end
end
endmodule