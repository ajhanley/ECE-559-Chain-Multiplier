module iteration(matlen,clk,iw,jw,ir,jr,kr,rw);
input[7:0] matlen;
input clk;
output[7:0] iw,jw,ir,jr,kr;
output rw;
wire i,j;

for(x = matlen; x>0; x=x-1)begin
	for(y =0 y<x; y=y+1)begin
		assign ir = y;
		assign jr = matlen-x+y;
		for(z =y; z<matlen-x+y;z=z+1)begin
			assign kr = z;
			if(z == matlen-x+y-1)begin
				assign rw=1;
				assign iw = y;
				assign jw = matlen-x+y;
			end
		end
	end
end

endmodule
