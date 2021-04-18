`inlcude "multiplier.v"
`include "adder.v"
`include "Comparator.v"
module comutational_logic(pk,pi,pj,mki,mkj1,clk,ko,min);
input[7:0] pk,pi,pj;
input[31:0] mki,mkj1;
input[31:0] kc;
input clk;
output[31:0] min,ko;

reg[31:0] minval,kval;
wire[31:0] w1,w2,w3,w4,w7,w8;
wire w5,lt, w6;
three_input_mult_8b p1(pk,pi,pj,w1);
three_input_adder_32b p2(mki,mkj1,w1,w2);
32bcomparator p3(w2,w3,w5,lt,w6);
mux_2_1_32b p4(w3,w2,lt,w7);
mux_2_1_32b p5(w4,kc,lt,w8);

assign w3[31:0] = minval[31:0];
assign w4[31:0] = kval;
assign ko = kval;
assign min = minval;
initial begin
 kval[31:0] = 0xFFFFFFFF;
 minval[31:0] = 0xFFFFFFFF;
end
endmodule
always @(posedgeclk)begin
	minval[31:0] = w7[31:0];
	kval[31:0] = w8[31:0];
end

module mux_2_1_32b(a,b,sel,out);
	input[31:0] a,b;
	input sel;
	output[31:0] out;
	assign out = sel?a:b;
endmodule