module solution_mat(clk,iw,jw,ir,jr,kr,rw,min,k,mik,mkj1);
input[7:0] iw,jw,ir,jr,kr;
input clk, rw;
input[31:0] min,k;
output[31:0] mik,mkj1;
//31x31 32 bit register;
reg[30:0][30:0][31:0] matrix;

initial begin
	for(i=0; i<30;i=i+1)begin
		for(j=0;j<30;j=j+1)begin
		 matrix[i][j] = 0x0000000;
		end
	end
end
endmodule