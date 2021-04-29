module solution_mat(rst,clk,in,jin,iw,jw,ir,jr,kr,rw,min,k,mik,mkj1,out,mout);
  input[7:0] iw,jw,ir,jr,kr,in,jin;
input clk, rw,rst;
input[31:0] min,k;
input out;
  output[31:0] mout;
output[31:0] mik,mkj1;
reg[31:0] readout1,readout2;
integer i,j;
//31x31 32 bit register;
reg[31:0] matrix[960:0];
  always @(posedge rst)begin
	for(i=0; i<30;i=i+1)begin
		for(j=0;j<30;j=j+1)begin
          matrix[i*31+j] = 0;
		end
	end
end
  always @(posedge clk) begin
    mout = matrix;
    if(rw) begin
      matrix[iw*31+jw] = min;
      matrix[jw*31+iw] = k;
    end else if(!rw) begin
      readout1=matrix[ir*31+kr];
      readout2=matrix[kr*31+jr];
    end
    if(out)begin
      readout1 = matrix[in*31+jin];
    end
  end
  assign mik = readout1;
  assign mkj1 = readout2;
  assign mout = readout1;
endmodule