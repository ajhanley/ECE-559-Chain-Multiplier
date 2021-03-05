//8 Bit magnitude comparator(NOT DONE)
module comparator(x,y,eq,lt,gt);
	input reg[7:0] x,y;
	output eq,lt,gt;
	
	reg[7:0] xn,yn;
	assign xn = ~x;
	assign yn = ~y;
	wire o1,o2,o3,o4,o5,o6,o7,o8;
	
	and g1 (o7,x[7],y[7]);
	and3 g2(o6,x[6],yn[6])
	and4 g3
	and5 g4
	and6 g5
	and7 g6
	and8 g7
	
endmodule

//Sinlgle Bit Magnitude Comparator(VERIFIED USING EDA PLAYGROUND)
module CMP(a,b,eq, lt, gt);
	input a,b;
	output eq, lt, gt;
	
	wire an;
	wire bn;
  	wire w;
  	wire z;
	
	not g1(an,a);
	not g2(bn,b);
  	and g3(w,a,b);
  	and g4(z,an,bn);
    or g5(eq,w,z);
	and g7(lt,an,b);
	and g8(gt,a,bn);
endmodule
//9 input AND
module and9(w,a,b,c,d,e,f,g,h,i);
	input a,b,c,d,e,f,g,h,i;
	output w;
	assign w = a & b & c & d & e & f & g & h& i;
endmodule
//8 input AND
module and8(w,a,b,c,d,e,f,g,h);
	input a,b,c,d,e,f,g,h;
	output w;
	assign w = a & b & c & d & e & f & g & h;
endmodule
//7 input AND
module and7(w,a,b,c,d,e,f,g);
	input a,b,c,d,e,f,g,;
	output w;
	assign w = a & b & c & d & e & f & g;
endmodule
//6 input AND
module and6(w,a,b,c,d,e,f);
	input a,b,c,d,e,f;
	output w;
	assign w = a & b & c & d & e & f;
endmodule
//5 input AND
module and5(w,a,b,c,d,e);
	input a,b,c,d,e;
	output w;
	assign w = a & b & c & d & e;
endmodule
//4 input AND
module and4(w,a,b,c,d);
	input a,b,c,d;
	output w;
	assign w = a & b & c & d;
endmodule
//3 input AND
module and3(w,a,b,c);
	input a,b,c;
	output w;
	assign w = a & b & c;
endmodule

module or8(w,a,b,c,d,e,f,g,h);
	input a,b,c,d,e,f,g,h;
	output w;
	assign w = a|b|c|d|e|f|g|h;
endmodule
/*
module tbCMP();
  reg a,b;
  wire eq,lt,gt;
  
  CMP UUT(a,b,eq,lt,gt);
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      a=0;b=0;
      #10;
      a=0;b=1;
      #10;
      a=1;b=0;
      #10;
      a=1;b=1;
      #10;
      a=0;b=0;
      #10;
    end
endmodule
*/