module ADD_SUB9 (
	input  [7:0] A, B,
	input        fn,
	output [8:0] S,
	output logic dataX
);

	logic [8:0] A9, B9;
	logic cout;
	
	assign A9[7:0] = A;
	assign A9[8] = A[7];
	
	assign B9[0] = B[0]^fn;
	assign B9[1] = B[1]^fn;
	assign B9[2] = B[2]^fn;
	assign B9[3] = B[3]^fn;
	assign B9[4] = B[4]^fn;
	assign B9[5] = B[5]^fn;
	assign B9[6] = B[6]^fn;
	assign B9[7] = B[7]^fn;
	assign B9[8] = B[7]^fn;
	
	ripple_adder add(.A(A9), .B(B9), .cin(fn), .S(S), .cout(cout));
	
endmodule	