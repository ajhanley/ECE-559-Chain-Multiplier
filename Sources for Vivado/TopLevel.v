// Code your design here
// Code your design here
`include "dimensional_matrix.v"
`include "iteration_mod.v"
`include "solution_mat.v"
`include "computation_mod.v"
module TopLevel(MatrixData,DataIn,rst,clk1,clk2, i_in, j_in,out,dataOut,matlength);

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

always @(posedge clk1)begin
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
	end
	if(rst)begin	
		dim_setup=1;
    		comprst=0;
    		iterateRst=0;
	end
	if(rw)begin
	    #50;
	    comprst=1;
    	    #10;
            comprst=0;
	end
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
