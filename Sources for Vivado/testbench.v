module tb();
reg clk1,clk2, rst, DataIn,out;
reg[7:0] MatrixData,i_in,j_in;
wire[7:0]matlen;
wire[31:0] dataOut;  
integer i,j;
  TopLevel m1(MatrixData,DataIn,rst,clk1,clk2,i_in, j_in,out,dataOut,matlen);
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
	MatrixData=8'hff;
    DataIn=1;
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
