// Code your design here
// Code your design here
`include "dimensional_matrix.v"
`include "iteration_mod.v"
`include "solution_mat.v"
`include "computation_mod.v"
module MatrixChainMultiplier(MatrixData,DataIn,rst,clk1,clk2, i_in, j_in,out,dataOut,matlength);

  input clk1,clk2,rst,DataIn,out;
  input[7:0] MatrixData;
  input[7:0] i_in,j_in;
  output[31:0] dataOut;
  output[7:0] matlength;
  wire rw;
  wire [7:0] p_i,p_j,p_k,MatrixLength, CountOut;
  wire[31:0] mout;
  wire[7:0] ioutw,joutw,ioutr,joutr,koutr;
  wire [31:0] min,k_min,m_i_k,m_k1_j ;
  reg[7:0] ir,jr,kr,iw,jw,kw,in,jin,pi,pj,pk;
  reg[7:0] matlen;
  reg[31:0]mik,mk1j, Min, Kmin;
  reg iterateRst;
  reg comprst;
  reg dim_setup;
  reg computation;

  assign matlength = matlen;
  
  dim_mat m1(DataIn,MatrixData,clk1,rst,MatrixLength,ir,jr+1,kr+1,p_i,p_j,p_k);
  
  solution_mat m2(rst,clk2,i_in,j_in,iw,jw,ir,jr,kr,rw,Min,Kmin,m_i_k,m_k1_j,out,dataOut);
  
  iterate loop(matlen,clk1,iterateRst,ioutw,joutw,ioutr,joutr,koutr,rw);
  
  computational_logic c1(pk,pi,pj,mik,mk1j,kr,clk1,comprst,k_min,min);
  
  always @* begin
    if(!dim_setup)begin
    	iw =ioutw;
    	jw = joutw;
    	ir = ioutr;
    	jr =joutr;
    	kr = koutr;
    	pi = p_i;
    	pj=p_j;
   	    pk=p_k;
    	mik = m_i_k;
    	mk1j = m_k1_j;
   	    matlen=MatrixLength;
    	Min=min;
    	Kmin = k_min;
      //$display("min: %d, kmin : %d",Min, Kmin);
      //$display("i: %d, j: %d, k: %d, rw: %d, min: %d, k: %d,pi = %d,pj = %d, pk = %d,mik = %d, mikj1 = %d",iw,jw,kr,rw,Min,Kmin,pi,pj,pk,mik,mk1j);
    end
  end
  always @(posedge rst)begin 
    dim_setup=1;
    comprst=0;
    iterateRst=0;
  end
  always @(posedge rw)begin
    #50;
    comprst=1;
    #10;
    comprst=0;
  end
  always @(posedge clk1)begin
    if(dim_setup) begin//Beginning Dimensional Matrix Filling Phase
		if(!DataIn) begin
			dim_setup=0;
			iterateRst=1; 
            comprst=1;
			#10;
			iterateRst=0;
            comprst=0;
		end
    end
  end
endmodule


/*
module tb();
reg clk1,clk2, rst, DataIn,out;
reg[7:0] MatrixData,i_in,j_in;
wire[7:0]matlen;
wire[31:0] dataOut;  
integer i,j;
  MatrixChainMultiplier m1(MatrixData,DataIn,rst,clk1,clk2,i_in, j_in,out,dataOut,matlen);
 always #25 clk2=~clk2;
always #50 clk1<=~clk1;
initial begin
	$dumpfile("dump.vcd");
    $dumpvars(1);
  	#20;
  out=0;
  	clk2=0;
	clk1=0;
	rst=0;
	#100;
	rst=1;
	#100;
  	rst=0;
	DataIn=1;
	MatrixData=8'hff;
	#100;
	MatrixData=8'hff;
	#100;
	MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
 	MatrixData=8'hff; 
	#100;
  MatrixData=8'hff;
	#100;
	MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff;
	#100;
	MatrixData=8'hff; 
	#100;
 	MatrixData=8'hff; 
	#100;
    MatrixData=8'hff; 
	#100;
  
    DataIn=0;
	#50;
    #10000000;
  
  for(i =0; i<matlen; i=i+1)begin
    for(j=0;j<matlen; j =j+1)begin
      i_in =i;
      j_in =j;
      out=1;
      #100;
      $display("SolutionMatrix[%d][%d] = %d",i,j,dataOut);
      out=0;
    end
  end
  	$finish;

end
endmodule


*/