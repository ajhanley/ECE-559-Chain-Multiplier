// Code your design here
module dim_mat(DataIn,MatrixIn,clk,rst,matlen,i,j,k,pi,pj,pk);
  input DataIn,clk,rst;
  input[7:0] MatrixIn,i,j,k;
  reg[7:0] dimMat[31:0];
  output[7:0] matlen;
  output[7:0] pi,pj,pk;
  integer x;
  reg[7:0] count;
  always @(posedge rst)begin
    count=0;
    for(x=0; x<32; x=x+1)begin
      dimMat[x] = 8'b00000000;
    end
  end
  always @(posedge clk)begin
    if(DataIn)begin
      dimMat[count] = MatrixIn;
      count=count+1;
      //$display(dimMat[count-1]);
    end
  end
  assign pi = dimMat[i];
  assign pj = dimMat[j];
  assign pk = dimMat[k];
  assign matlen = count-1;
endmodule
/*
module tb();
  reg DataIn,clk,rst;
  reg[7:0] MatrixIn,i,j,k;
  wire[7:0] matlen,pi,pk,pj;
  integer x;
  dim_mat m1(DataIn,MatrixIn,clk,rst,matlen,i,j,k,pi,pj,pk);
  always #10 clk=~clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
	clk=0;
    DataIn=0;
    #11;
    rst=1;
    #10;
    rst=0;
    DataIn=1;
    MatrixIn = 8'b00000001;
    #20;
    MatrixIn = 8'b00000010;
    #20;
    MatrixIn = 8'b00000011;
    #20;
    MatrixIn = 8'b00000100;
    #20;
    MatrixIn = 8'b00000101;
    #20;
    DataIn = 0;
    #50;
    for(x=0; x<5; x=x+1)begin
      i=x;
      #10;
    end
    $finish;
    
  end
  
  
  
endmodule
*/