//8 Bit magnitude comparator(VERIFIED ON EDA PLAYGROUND AS WORKING)
module comparator(x,y,eq,lt,gt);
	input [7:0] x,y;
	output eq,lt,gt;
	
	wire[7:0] xn,yn;
	assign xn = ~x;
	assign yn = ~y;
	wire eq0, eq1,eq2,eq3,eq4, eq5, eq6, eq7;
	wire gt0, gt1, gt2, gt3, gt4, gt5, gt6, gt7;
	wire lt0, lt1, lt2, lt3, lt4, lt5, lt6, lt7;
	//A=B
	xnor g0(eq0,x[0],y[0]);
	xnor g1(eq1,x[1],y[1]);
	xnor g2(eq2,x[2],y[2]);
	xnor g3(eq3,x[3],y[3]);
	xnor g4(eq4,x[4],y[4]);
	xnor g5(eq5,x[5],y[5]);
	xnor g6(eq6,x[6],y[6]);
	xnor g7(eq7,x[7],y[7]);
	and8 g8(eq,eq0,eq1,eq2,eq3,eq4,eq5,eq6,eq7);
	/*A>B Cases: (A7=1 and B7=0), (A7=B7 and A6=1 and B6=0), (A7=B7 A6=B6 A5=1 and B5=0), (A7=B7 A6=B6 A5=B5 A4=1 B4=0)
	 (A7=B7 A6=B6 A5=B5 A4=B4 and A3=1 B3=0), (A7=B7 A6=B6 A5=B5 A4=B4 A3=B3 and A2=1 B2=0),( A7=B7 A6=B6 A5=B5 A4=B4 A3=B3 A2=B2 and A1=1 B1=0)
	(A7=B7 A6=B6 A5=B5 A4=B4 A3=B3 A2=B2 A1=B1 and A1=1 B1=0)
	*/
	and g9(gt7, x[7],yn[7]);
	and3 g10(gt6, eq7,x[6],yn[6]);
	and4 g11(gt5, eq7, eq6, x[5], yn[5]);
	and5 g12(gt4, eq7, eq6, eq5, x[4], yn[4]);
	and6 g13(gt3, eq7, eq6, eq5, eq4, x[3], yn[3]);
	and7 g14(gt2, eq7, eq6, eq5, eq4, eq3, x[2], yn[2]);
	and8 g15(gt1, eq7, eq6, eq5, eq4, eq3, eq2,x[1], yn[1]);
	and9 g16(gt0, eq7, eq6, eq5, eq4, eq3, eq2, eq1, x[0], yn[0]);
	or8 g17(gt,gt0,gt1,gt2,gt3,gt4,gt5,gt6,gt7);
	//A<B is the same as A>B, but swap all x refs to xn and yn refs to y:
	and g18(lt7, xn[7],y[7]);
	and3 g19(lt6, eq7,xn[6],y[6]);
	and4 g20(lt5, eq7, eq6, xn[5], y[5]);
	and5 g21(lt4, eq7, eq6, eq5, xn[4], y[4]);
	and6 g22(lt3, eq7, eq6, eq5, eq4, xn[3], y[3]);
	and7 g23(lt2, eq7, eq6, eq5, eq4, eq3, xn[2], y[2]);
	and8 g24(lt1, eq7, eq6, eq5, eq4, eq3, eq2,xn[1], y[1]);
	and9 g25(lt0, eq7, eq6, eq5, eq4, eq3, eq2, eq1, xn[0], y[0]);
	or8 g26(lt,lt0,lt1,lt2,lt3,lt4,lt5,lt6,lt7);
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
	input a,b,c,d,e,f,g;
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
/*
module tb8BComp();
	reg [7:0] x,y;
	wire eq,lt,gt;
	comparator UUT(x,y,eq,lt,gt);
	initial
		begin
		$dumpfile("dump.vcd");
		$dumpvars(1);
		x = 8'b00000000; y = 8'b00000000;
		#20;
		x = 8'b00000001; y = 8'b00000000;
		#20;
		x = 8'b00000000; y = 8'b00000001;
		#20;
		x = 8'b00000000; y = 8'b00000000;
		#20;
		*/