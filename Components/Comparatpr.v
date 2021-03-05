//8 Bit magnitude comparator
module comparator(x,y,eq,lt,gt);
	input reg[7:0] x,y;
	output eq,lt,gt;
	
	
	

endmodule

//Sinlgle Bit Magnitude Comparator
module CMP(a,b,eq, lt, gt);
	input a,b;
	output eq, lt, gt;
	
	wire an;
	wire bn;
	
	not g1(an,a);
	not g2(bn,b);
	and g3(eq,a,b);//if both are same, return eq=1
	and g4(lt,an,b);
	and g5(gt,a,bn);
endmodule