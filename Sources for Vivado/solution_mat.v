module solution_mat(rst,clk,in,jin,iw,jw,ir,jr,kr,rw,min,k,mik,mkj1,out,mout);
  input[7:0] iw,jw,ir,jr,kr,in,jin;
input clk, rw,rst;
input[31:0] min,k;
input out;
  output[31:0] mout;
output[31:0] mik,mkj1;
wire sen;
reg[31:0] readout1,readout2,readout3;
integer i,j;
assign sen = clk|rst|rw;
//31x31 32 bit register;
reg[31:0] matrix[960:0];
always @(posedge clk)begin
	if(rst)begin
		for(i=0; i<31;i=i+1)begin
			for(j=0;j<31;j=j+1)begin
				matrix[i*31+j] = 0;
                	end
        	end
	end
	else begin
		if(rw)begin
			matrix[iw*31+jw] = min;
    			matrix[jw*31+iw] = k;
		end
		else begin
			readout1=matrix[ir*31+kr];
      			readout2=matrix[(kr+1)*31+jr];
		end
		if(out)begin
			readout3 = matrix[in*31+jin];
		end
	end
end
assign mik = readout1;
assign mkj1 = readout2;
assign mout = readout3;
endmodule
