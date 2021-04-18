module matrixReg(x, y, z, l, w, clk);
//Matrix Register Holds x, the horizontal coordinate, y the vertical coordinate, and z, the data to be written. additonally there are two registers w and h to hold 8 bit values of the width and height of our matrix
	input[7:0] w,h,z;
	input x,y;
	
	reg[7:0] matrix [32:0][32:0]; //2 dimensional(32x32) 8 bit registers
	
	initial begin
		
	end
	always @(posedge clck)
	begin
		
	end

endmodule