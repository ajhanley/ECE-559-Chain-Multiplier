`include "adder.v"
//8 bit-3 Input Multiplier:

module my_mult_8b_3in(A,B,C,P,zero);
input[7:0] A,B,C;
output [31:0] P;
  input zero;
wire[15:0] AB;
  mult_8b_2in m1(A,B,AB,zero);
  mult_16b_2in m2(C,AB,P,zero);
endmodule


module mult_16b_2in(A,B,P,zero);
input[15:0] A,B;
output [32:0] P;
  input zero;
wire[15:0] p1,p2,p3,p4;
wire [16:0] s1,s2;
wire c1,c2;
  mult_8b_2in m1(A[7:0],B[7:0],p1,zero);
  mult_8b_2in m2(A[7:0],B[15:8],p2,zero);
  mult_8b_2in m3(A[15:8],B[7:0],p3,zero);
  mult_8b_2in m4(A[15:8],B[15:8],p4,zero);
  carry_save_add_16 a1(p3,p2,p1[15:8],s1,c1,zero);
  carry_save_add_16 a2(p4,16'd0,s1[15:8],s2,c2,zero);
  assign P[7:0] = p1[7:0];
assign P[15:8] = s1[7:0];
assign P[31:16] = s2[15:0];
endmodule


module mult_8b_2in(A,B,P,zero);
input [8:0] A,B;
output [15:0] P;
input zero;
wire[7:0] p1,p2,p3,p4;
wire [8:0] s1,s2;
wire c1,c2;
  mult_4x4 m1(A[3:0],B[3:0],p1,zero);
  mult_4x4 m2(A[3:0],B[7:4],p2,zero);
  mult_4x4 m3(A[7:4],B[3:0],p3,zero);
  mult_4x4 m4(A[7:4],B[7:4],p4,zero);
  carry_save_add_8 a1(p2,p3,p1[7:4],s1,c1,zero);
  carry_save_add_8 a2(p4,8'd0,s1[7:4],s2,c2,zero);
assign P[3:0] = p1[3:0];
assign P[7:4] = s1[3:0];
assign P[15:8] = s2[7:0];
endmodule

module mult_4x4(A,B,P,zero);
	input [3:0] A,B;
	output[7:0] P;
    input zero;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,c1,c2,c3;
	wire[3:0] add1_1,add1_2,add2_1,add2_2,add3_1,add3_2;
	wire [3:0] sum1,sum2,sum3;

  assign w1 = A[0]&B[0];
  assign w2 = A[0]&B[1];
  assign w3 = A[0]&B[2];
  assign w4 = A[0]&B[3];

  assign w5 =A[1]&B[0];
  assign w6 =A[1]&B[1];
  assign w7 =A[1]&B[2];
  assign w8 =A[1]&B[3];

  assign w9 =A[2]&B[0];
  assign w10 =A[2]&B[1];
  assign w11 =A[2]&B[2];
  assign w12 =A[2]&B[3];

  assign w13 =A[3]&B[0];
  assign w14 =A[3]&B[1];
  assign w15 =A[3]&B[2];
  assign w16 =A[3]&B[3];
  assign add1_1 = {zero,w4,w3,w2};
  assign add1_2 = {w8,w7,w6,w5};
  
  add_4b add1(add1_1,add1_2,sum1,c1,zero);
  assign add2_1 = {c1,sum1[3:1]};
  assign add2_2 = {w12,w11,w10,w9};
  add_4b add2(add2_1,add2_2,sum2,c2,zero);
  assign add3_1 = {c2,sum2[3:1]};
  assign add3_2 = {w16,w15,w14,w13};
  add_4b add3(add3_1,add3_2,sum3,c3,zero);
  
	assign P[0] = w1;
	assign P[1] = sum1[0];
	assign P[2] = sum2[0];
  assign P[7:3] = {c3,sum3[3:0]};
endmodule
  
module add_4b(a,b,s,c,Zero);
    input[3:0] a,b;
    output[3:0] s;
	output c;
	input Zero;
	wire cout[3:0];
  full_adder a1(a[0],b[0],Zero,s[0],cout[0]);
  full_adder a2(a[1],b[1],cout[0],s[1],cout[1]);
  full_adder a3(a[2],b[2],cout[1],s[2],cout[2]);
  full_adder a4(a[3],b[3],cout[2],s[3],cout[3]);
  assign c = cout[3];
endmodule
  