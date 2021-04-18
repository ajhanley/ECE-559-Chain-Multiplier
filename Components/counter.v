//Computes a count each clock cycle and outputs it on val
module counter(clk,rst,max,val);
input clk,rst;
input[7:0] max;
output [7:0] val;
reg[7:0] count;

assign val = count;
always @(posedge clk)begin
	count = count+1;
	if(count=max)begin
		count=count-1;
	end
end
always @(posedge rst)begin
	count=0;
end

endmodule