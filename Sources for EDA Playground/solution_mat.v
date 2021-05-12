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
    for(i=0; i<31;i=i+1)begin
      for(j=0;j<31;j=j+1)begin
          matrix[i*31+j] = 0;
		end
	end
end
  always@(posedge rw)begin
    //$display("i:%d, j: %d, min: %d, k: %d",iw,jw,min,k);
      matrix[iw*31+jw] = min;
      matrix[jw*31+iw] = k;
   //$display("%d Written to M[%d][%d] = %d",min,iw,jw,matrix[iw*31+jw]);
  end
  always @(posedge clk) begin
    if(!rw) begin
      //$display("i=%d, j= %d, k= %d , min= %d",ir,jr,kr,min);
      //$display("Mik = %d matrix read = %d, mk1j = %d,matrix read = %d ",mik,matrix[ir*31+kr],mkj1,matrix[(kr+1)*31+jr]);
      readout1=matrix[ir*31+kr];
      readout2=matrix[(kr+1)*31+jr];
    end
    if(out)begin
      readout1 = matrix[in*31+jin];
    end
  end
  assign mik = readout1;
  assign mkj1 = readout2;
  assign mout = readout1;
endmodule

/*
module tb;
  reg[7:0] iw,jw,ir,jr,kr,in,jin;
  reg clk,rw,rst;
  reg[31:0] min,k;
  reg out;
  wire[31:0] mout,mik,mkj1;
  integer i,j;
  solution_mat m1(rst,clk,in,jin,iw,jw,ir,jr,kr,rw,min,k,mik,mkj1,out,mout);
  always #10 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    rst=0;
    clk=0;
    #20;
    rst=1;
    #20;
    for(i=0; i<10; i = i+1)begin
      for(j=0; j<10; j=j+1)begin
       rw=0;
       iw = i;
       jw = j;
       min = i;
       k = i+1;
       #20;
       rw=1;
       #40;
       ir = i;
       kr=j;
       jr=i;
       #40;
      end
    end
    $finish;
  end 
endmodule
*/