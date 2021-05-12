// Code your design here
module dim_mat(DataIn,MatrixIn,clk,rst,matlen,i,j,k,pi,pj,pk);
  input DataIn,clk,rst;
  input[7:0] MatrixIn,i,j,k;
  reg[7:0] dimMat[31:0];
  output[7:0] matlen;
  output[7:0] pi,pj,pk;
  integer x;
  reg[7:0] count;
  wire sen;
  assign sen = rst|clk;
  always@(posedge clk)begin
    if(rst)begin
      count=0;
    for(x=0; x<32; x=x+1)begin
      dimMat[x] = 8'b00000000;
    end
    end
    else begin 
      if(DataIn)begin
        dimMat[count] = MatrixIn;
        count=count+1;
      end
    end
  end
  assign pi = dimMat[i];
  assign pj = dimMat[j];
  assign pk = dimMat[k];
  assign matlen = count-1;
endmodule
