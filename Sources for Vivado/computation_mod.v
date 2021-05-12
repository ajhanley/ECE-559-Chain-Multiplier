// Code your design here

`include "Multiplier.v"
`include "Comparator.v"
module computational_logic(pk,pi,pj,mki,mkj1,kc,clk,rst,ko,min);
  input[7:0] pk,pi,pj;
  input[31:0] mki,mkj1;
  input[31:0] kc;
  input rst;
  input clk;
  output[31:0] min,ko;
  reg[31:0] minimum, kval;
  reg zero;
  wire cout;
  wire[31:0] mout,sout;
  wire[31:0] out1,out2;
  wire[31:0] minmux,kmux;
  
  wire lt,gt,eq;
  wire sen;
  my_mult_8b_3in mul(pk,pi,pj,mout,zero);
  adder_3in_32b a1(mki,mkj1,mout,zero,sout,cout);
  my_comparator_32b c1(sout,out1,eq,lt,gt);
  mux_2_1_32b m1(sout,out1,lt,minmux);
  mux_2_1_32b m2(kc,out2,lt,kmux);
  assign sen = rst |clk;
  always @(posedge clk)begin
    if(rst)begin
      minimum=32'hffffffff;
      kval=32'h00000000;
      zero=0;
    end
    else begin
      minimum = minmux;
      kval = kmux;
    end
  end

 assign out1 = minimum;
 assign out2 = kval;
 assign min = minimum;
 assign ko = kval;
endmodule

module mux_2_1_32b(a,b,sel,out);
	input[31:0] a,b;
	input sel;
	output[31:0] out;
	assign out = sel?a:b;
endmodule
