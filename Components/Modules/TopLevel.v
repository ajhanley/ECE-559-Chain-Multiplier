// Code your design here
`include "dimensional_matrix.v"
`include "iteration_mod.v"
`include "solution_mat.v"
`include "computation_mod.v"
module MatrixChainMultiplier(MatrixData,DataIn,rst,clk, i_in, j_in,out,dataOut,matlength);

  input clk,rst,DataIn,out;
  input[7:0] MatrixData;
  input[7:0] i_in,j_in;
  output[31:0] dataOut;
  output[7:0] matlength;
  wire rw;
  wire [4:0] i,j,k;
  wire [7:0] p_i,p_j,p_k,MatrixLength, CountOut;
  wire[31:0] mout;
  wire[7:0] ioutw,joutw,ioutr,joutr,koutr;
  wire [31:0] min,k_min,m_i_k,m_k1_j ;
  reg[7:0] ir,jr,kr,iw,jw,kw,in,jin;
  reg[7:0] matlen;
  reg iterateRst;
  reg comprst;
  reg dim_setup;
  reg computation;

  assign matlength = matlen;
  Dimensional_Matrix m1(MatrixData,CountOut, p_i,ir,p_k,kr,p_j,jr,rst,DataIn, clk, MatrixLength);

  solution_mat m2(rst,clk,i_in,j_in,iw,jw,ir,jr,kr,rw,min,k_min,m_i_k,m_k1_j,out,dataOut);
  
  iterate loop(matlen,clk,iterateRst,ioutw,joutw,ioutr,joutr,koutr,rw);
  
  computational_logic c1(p_k,p_i,p_j,m_i_k,m_k1_j,kr,clk,comprst,k_min,min);
  
  always @* begin
    iw = ioutw;
    jw = joutw;
    ir = ioutr;
    jr = joutr;
    kr = koutr;
    matlen=MatrixLength;
  end
  always @(posedge rst)begin 
    dim_setup=1;
    comprst=0;
    iterateRst=0;
  end
  always @(posedge j or negedge j or posedge i or negedge i)begin
    comprst=1;
    #10;
    comprst=0;
  end
  always @(posedge clk)begin
    if(dim_setup) begin//Beginning Dimensional Matrix Filling Phase
		if(!DataIn) begin
			dim_setup=0;
			iterateRst=1;
			#1;
			iterateRst=0;
		end
    end
	else begin //Beginning Computation Phase
		
	end
  end
endmodule


/*
// Code your testbench here
// or browse Examples
module tb();
reg clk, rst, DataIn,out;
reg[7:0] MatrixData,i_in,j_in;
wire[7:0]matlen;
wire[31:0] dataOut;  
integer i,j;
  MatrixChainMultiplier m1(MatrixData,DataIn,rst,clk,i_in, j_in,out,dataOut,matlen);
always #50 clk=~clk;
initial begin
	$dumpfile("dump.vcd");
    $dumpvars(1);
	clk=0;
	rst=0;
	#2;
	rst=1;
	DataIn=1;
	#49;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
	MatrixData=8'b00000001;
	#50;
    DataIn=0;
    #500;
  for(i =0; i<31; i=i+1)begin
    for(j=0;j<31; j =j+1)begin
      i_in =i;
      j_in =j;
      out=1;
      #50;
      $display("SolutionMatrix[%d][%d] = 0x%0h",i,j,dataOut);
      out=0;
    end
  end
  	$finish;

end
endmodule

*/