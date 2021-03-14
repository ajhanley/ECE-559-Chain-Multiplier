module three_input_adder(in_a,in_b,in_c,sum,cout);
	
	input [07:0]in_a;
	input [07:0]in_b;
	input [07:0]in_c;
	output [07:0]sum;
	output cout;
	wire[6:0] first_sum;
	wire first_cout;
	
	eight_bit_adder(in_a,in_b,cin,first_sum,first_cout);
	eight_bit_adder(in_c,first_sum,first_cout,sum,cout);



endmodule 



module eight_bit_adder(a,b,cin,sum,cout);

	input [07:0]a;
	input [07:0]b;
	input cin;
	output [7:0]sum;
	output cout;
	wire[6:0] c;
	
	full_adder b1(a[0],b[0],cin,sum[0],c[0]);
	full_adder b1(a[1],b[1],c[0],sum[1],c[1]);
	full_adder b1(a[2],b[2],c[1],sum[2],c[2]);
	full_adder b1(a[3],b[3],c[2],sum[3],c[3]);
	full_adder b1(a[4],b[4],c[3],sum[4],c[4]);
	full_adder b1(a[5],b[5],c[4],sum[5],c[5]);
	full_adder b1(a[6],b[6],c[5],sum[6],c[6]);
	full_adder b1(a[7],b[7],c[6],sum[7],cout);

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