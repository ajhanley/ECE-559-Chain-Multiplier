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
always @(posedge clk) begin 
	if(rw) begin
	
	end else if(!rw) beginmodule solution_mat(rst,clk,iw,jw,ir,jr,kr,rw,min,k,mik,mkj1);
input[7:0] iw,jw,ir,jr,kr;
input clk, rw,rst;
input[31:0] min,k;
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
    if(rw) begin
      matrix[iw*31+jw] = min;
      matrix[jw*31+iw] = k;
    end else if(!rw) begin
      readout1=matrix[ir*31+kr];
      readout2=matrix[kr*31+jr];
    end
  end
  assign mik = readout1;
  assign mkj1 = readout2;
endmodule
	
	
	end
end
endmodule

/*

module tb();
  
  reg [7:0] iw,jw,ir,jr,kr;
  reg [31:0] min,k;
  reg clk,rw,rst;
  wire[31:0] mik, mkj1;
  
  solution_mat m1(rst,clk,iw,jw,ir,jr,kr,rw,min,k,mik,mkj1);
  always #20 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk=0;
    rst=0;
    #1;
    rst=1;
    #1;
    rst=0;
    iw=8'b00000000;
    jw =8'b00000000;
    min = 10;
    k = 3;
    rw=1;
    #10
    iw=8'b00000001;
    jw =8'b00000001;
    min = 15;
    k = 5;
    rw=1;
    #10;
    rw=0;
    ir=8'b00000000;
    jr=8'b00000000;
    kr=8'b00000000;
    #10;
    ir=8'b00000001;
    jr=8'b00000001;
    kr=8'b00000001;
    $finish;
  end
endmodule
  
*/