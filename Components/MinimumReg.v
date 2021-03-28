//This is a brief top level entity for all these components. This should not go into the final product, but it does show how these components should be layed out.
//TODO: need to add support for up to 4 byte magnitude comparaotr by adding supporting logic to chain together my 8 bit ones
`include "Comparator.v"
module top(newval,MinOut,KOut,clk);
input newval;
output MinOut,KOut;



endmodule()
//minimum register logic
module MinimumReg(Do,Di,clk);
input Di,clk;
output Do;
reg[31:0] register;
initial begin
	register[31:0] = 0xFFFFFFFF;
end
always @(posedge clk)begin
	assign register = Di;
	assign Do = register;
endmodule
//k value register logic
module kReg(Do,Di,clk);
input Di,clk;
output Do;
reg[31:0] register;
initial begin
	register[31:0] = 0xFFFFFFFF;
end
always @(posedge clk)begin
	assign register = Di;
	assign Do = register;
endmodule
//4 byte 2-1 Mux
module 4BMux21(Y,D0,D1,S);
input D0[31:0],D1[31:0],S
output Y[31:0];
assign Y=(S)?D1:D0;
endmodule
//2 to 1 Mux, but for 1 Bit
module mux21(Y,D0,D1,S);

input D1,D0,S;
output Y;
wire w1,w2,w3;

and g1(w1,D1,S);
not g2 (w2,S);
and g3(w3,D0,w2);
or g3(Y,w1,w3);
endmodule;