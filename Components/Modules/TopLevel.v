// Code your design here
module MatrixChainMultiplier(MatrixData,DataIn,rst,clk);

  input clk,rst,DataIn;
  input[7:0] MatrixData;
  
  wire rw;
  wire [4:0] i,j,k;
  wire [7:0] p_i,p_j,p_k,MatrixLength, I_Write,J_Write,K_Write, I_Read,J_Read,K_Read, ;
  
  wire [31:0] min,k_min,m_i_k,m_k1_j ;
  
  reg dim_setup;
  reg computation;
  
  
  DimensionalMatrix m1(MatrixData, ??, p_i,i,p_k,k,p_j,j,rst,DataIn, clk, MatrixLength);
  solution_mat m2(clk,iw,jw,ir,jr,kr,rw,min,k_min,m_i_k,m_k1_j);
  iterate loop(matlen,clk,reset,I_Write,J_Write,I_Read,J_Read,K_Read,rw);
  computational_logic c1(p_k,p_i,p_j,mki,mkj1,kc,clk,rst,k_min,min);
  always @(posedge rst)begin 
    dim_setup=1;
    computation=0;
  end
  always @(posedge clk)begin
    if(dim_setup) begin
      if(!DataIn) begin
        dim_setup=0;
        computation1;
       end
      end
      
    end
  end
endmodule