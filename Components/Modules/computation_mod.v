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
  
  mult_8b_3in mul(pk,pi,pj,mout,zero);
  adder_3in_32b a1(mki,mkj1,mout,zero,sout,cout);
  comparator_32b c1(sout,out1,eq,lt,gt);
  mux_2_1_32b m1(sout,out1,lt,minmux);
  mux_2_1_32b m2(kc,out2,lt,kmux);
  
  always @(posedge rst)begin
    minimum=32'hffffffff;
    kval=32'h00000000;
    zero=0;
  end
  always @(posedge clk)begin
    //$display("%d,%d,%d,%d,%d,%d,%d,%d",pi,pj,pk,mki,mkj1,minimum,kval,mout);
    minimum = minmux;
    kval = kmux;
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

/*
// Code your testbench here
// or browse Examples
module tb();
  reg[7:0]  pk,pi,pj;
  reg[31:0] mki,mkj1,kc;
  reg clk,rst;
  wire[31:0] min,ko;
  
  computational_logic c1(pk,pi,pj,mki,mkj1,kc,clk,rst,ko,min);
  always #20 clk=~clk;
  initial begin
  	$dumpfile("dump.vcd");
    $dumpvars(1);
    rst=1;
    #2;
    rst=0;
    #2;
    rst=1;
    #1;
    pk=8'b0000001;
    pi=8'b0000001;
    pj=8'b0000001;
    mki = 32'h00000011;
    mkj1 = 32'h0000111;
    kc= 32'h00000001;
    clk=0;
    #15;
    pk=8'b0000001;
    pi=8'b0000001;
    pj=8'b0000001;
    mki = 32'h00000001;
    mkj1 = 32'h0000001;
    kc= 32'h00000002;
    #500;
    $finish;
  end
endmodule
*/