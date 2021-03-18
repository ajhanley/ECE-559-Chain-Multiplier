//8 bit-3 Input Multiplier:

//8 bit 2-input multiplier


//2 input multiplier 2 bit
module 2bmul(x,y,z);
	input [1:0] x,y;
	output[4:0] z;
	
	wire w1,w2,w3,w4,w5,w6;
	and g1(w1,x[0],y[1]);
	and g2(z[0],x[0],y[0]);
	and g3(w2,x[1],y[0]);
	and g4(w3,x[1],y[1]);
	xor g5(z[1],w1,w2);
	and g6(w4,w2,w1);
	xor g7(z[2],w4,w3);
	and g8()