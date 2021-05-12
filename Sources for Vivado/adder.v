module three_input_adder(in_a,in_b,in_c,sum,cout);
	
	input [07:0]in_a;
	input [07:0]in_b;
	input [07:0]in_c;
	output [07:0]sum;
	output cout;
	wire[7:0] first_sum;
	wire first_cout;
	
	eight_bit_adder a1(in_a,in_b,1'b0,first_sum,first_cout);
	eight_bit_adder a2(in_c,first_sum,first_cout,sum,cout);



endmodule 

module adder_3in_32b(A,B,C,Cin,Sum,Cout);
  
  input[31:0] A,B,C;
  input Cin;
  output [31:0] Sum;
  output Cout;
  wire[31:0] sum1;
  wire c1;
  adder_32_b a1(A,B,Cin,sum1,c1);
  adder_32_b a2(sum1,C,c1,Sum,Cout);
endmodule


module eight_bit_adder(a,b,cin,sum,cout);

	input [07:0]a;
	input [07:0]b;
	input cin;
	output [7:0]sum;
	output cout;
	wire[6:0] c;
	
	full_adder b1(a[0],b[0],cin,sum[0],c[0]);
	full_adder b2(a[1],b[1],c[0],sum[1],c[1]);
	full_adder b3(a[2],b[2],c[1],sum[2],c[2]);
	full_adder b4(a[3],b[3],c[2],sum[3],c[3]);
	full_adder b5(a[4],b[4],c[3],sum[4],c[4]);
	full_adder b6(a[5],b[5],c[4],sum[5],c[5]);
	full_adder b7(a[6],b[6],c[5],sum[6],c[6]);
    full_adder b8(a[7],b[7],c[6],sum[7],cout);

endmodule
	
module adder_32_b(a,b,cin,sum,cout);
  input[31:0] a,b;
  input cin;
  output[31:0] sum;
  output cout;
  wire[3:0] c;
  wire[7:0] sum1,sum2,sum3,sum4;
  eight_bit_adder a1(a[7:0],b[7:0],cin,sum1,c[0]);
  eight_bit_adder a2(a[15:8],b[15:8],c[0],sum2,c[1]);
  eight_bit_adder a3(a[23:16],b[23:16],c[1],sum3,c[2]);
  eight_bit_adder a4(a[31:24],b[31:24],c[2],sum4,c[3]);
  assign sum = {sum4, sum3, sum2, sum1};
  assign cout = c[3];
  
endmodule



module full_adder(ain,bin,cin,sum,cout);

    output cout;
    output sum;
    input ain;
    input bin;
    input cin;
    assign sum = ain^bin^cin;
    assign cout = (ain&bin) | (ain&cin) | (bin&cin);
	
endmodule

module carry_save_add_8(A,B,Cin,S,C,zero);
input[7:0] A,B,Cin;
input zero;
output[8:0] S;
output C;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16;

assign zero =0;

full_adder a1(A[0],B[0],Cin[0],S[0],c1);
full_adder a2(A[1],B[1],Cin[1],w2,c2);
full_adder a3(A[2],B[2],Cin[2],w3,c3);
full_adder a4(A[3],B[3],Cin[3],w4,c4);
full_adder a5(A[4],B[4],Cin[4],w5,c5);
full_adder a6(A[5],B[5],Cin[5],w6,c6);
full_adder a7(A[6],B[6],Cin[6],w7,c7);
full_adder a8(A[7],B[7],Cin[7],w8,c8);

full_adder a9(w2,zero,c1,S[1],c9);
full_adder a10(c2,w3,c9,S[2],c10);
full_adder a11(c3,w4,c10,S[3],c11);
full_adder a12(c4,w5,c11,S[4],c12);
full_adder a13(c5,w6,c12,S[5],c13);
full_adder a14(c6,w7,c13,S[6],c14);
full_adder a15(c7,w8,c14,S[7],c15);
full_adder a16(c8,zero,c15,S[8],C);

endmodule

module carry_save_add_16(A,B,Cin,S,C,zero);
input[15:0] A,B,Cin;
input zero;
output[16:0] S;
output C;
wire[30:0] c;
wire[15:0] w;
full_adder a1(A[0],B[0],Cin[0],S[0],c[0]);
full_adder a2(A[1],B[1],Cin[1],w[1],c[1]);
full_adder a3(A[2],B[2],Cin[2],w[2],c[2]);
full_adder a4(A[3],B[3],Cin[3],w[3],c[3]);
full_adder a5(A[4],B[4],Cin[4],w[4],c[4]);
full_adder a6(A[5],B[5],Cin[5],w[5],c[5]);
full_adder a7(A[6],B[6],Cin[6],w[6],c[6]);
full_adder a8(A[7],B[7],Cin[7],w[7],c[7]);
full_adder a9(A[8],B[8],Cin[8],w[8],c[8]);
full_adder a10(A[9],B[9],Cin[9],w[9],c[9]);
full_adder a11(A[10],B[10],Cin[10],w[10],c[10]);
full_adder a12(A[11],B[11],Cin[11],w[11],c[11]);
full_adder a13(A[12],B[12],Cin[12],w[12],c[12]);
full_adder a14(A[13],B[13],Cin[13],w[13],c[13]);
full_adder a15(A[14],B[14],Cin[14],w[14],c[14]);
full_adder a16(A[15],B[15],Cin[15],w[15],c[15]);

full_adder a17(zero,w[1],c[0],S[1],c[16]);
full_adder a18(c[1],w[2],c[16],S[2],c[17]);
full_adder a19(c[2],w[3],c[17],S[3],c[18]);
full_adder a20(c[3],w[4],c[18],S[4],c[19]);
full_adder a21(c[4],w[5],c[19],S[5],c[20]);
full_adder a22(c[5],w[6],c[20],S[6],c[21]);
full_adder a23(c[6],w[7],c[21],S[7],c[22]);
full_adder a24(c[7],w[8],c[22],S[8],c[23]);
full_adder a25(c[8],w[9],c[23],S[9],c[24]);
full_adder a26(c[9],w[10],c[24],S[10],c[25]);
full_adder a27(c[10],w[11],c[25],S[11],c[26]);
full_adder a28(c[11],w[12],c[26],S[12],c[27]);
full_adder a29(c[12],w[13],c[27],S[13],c[28]);
full_adder a30(c[13],w[14],c[28],S[14],c[29]);
full_adder a31(c[14],w[15],c[29],S[15],c[30]);
full_adder a32(c[15],zero,c[30],S[16],C);
endmodule
