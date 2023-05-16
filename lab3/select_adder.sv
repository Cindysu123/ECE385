module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic c0, c1, c2, cout00, cout10, cout01, cout11, cout20, cout21;
	  
	  
	  four_bit_ra FRA0(.x(A[3:0]), .y(B[3:0]), .cin(cin), .s(S[3:0]), .cout(c0));
	  four_select_adder four_sa1(.x(A[7:4]), .y(B[7:4]), .cin(c0), .s(S[7:4]), .cout0(cout00), .cout1(cout01));
	  assign c1 = (c0 & cout01) | cout00;
	  four_select_adder four_sa2(.x(A[11:8]), .y(B[11:8]), .cin(c1), .s(S[11:8]), .cout0(cout10), .cout1(cout11));
	  assign c2 = (c1 & cout11) | cout10;
	  four_select_adder four_sa3(.x(A[15:12]), .y(B[15:12]), .cin(c2), .s(S[15:12]), .cout0(cout20), .cout1(cout21));
	  assign cout = (c2 & cout21) | cout20;

endmodule

module four_select_adder(

						input [3:0] x,
						input [3:0] y,
						input cin,
						output logic [3:0] s,
						output logic cout0,
						output logic cout1
						);
		
		logic c00, c01, c02, c10, c11, c12;
		logic s00, s01, s02, s03, s10, s11, s12, s13;
		
		// carry 0
		full_adder fa00(.x(x[0]), .y(y[0]), .z(1'b0), .s(s00), .c(c00));
		full_adder fa01(.x(x[1]), .y(y[1]), .z(c00), .s(s01), .c(c01));
		full_adder fa02(.x(x[2]), .y(y[2]), .z(c01), .s(s02), .c(c02));
		full_adder fa03(.x(x[3]), .y(y[3]), .z(c02), .s(s03), .c(cout0));
		
		//carry 1
		full_adder fa10(.x(x[0]), .y(y[0]), .z(1'b1), .s(s10), .c(c10));
		full_adder fa11(.x(x[1]), .y(y[1]), .z(c10), .s(s11), .c(c11));
		full_adder fa12(.x(x[2]), .y(y[2]), .z(c11), .s(s12), .c(c12));
		full_adder fa13(.x(x[3]), .y(y[3]), .z(c12), .s(s13), .c(cout1));
		
		//mux sums
		two_one_mux mux0(.x(s00), .y(s10), .c(cin), .s(s[0]));
		two_one_mux mux1(.x(s01), .y(s11), .c(cin), .s(s[1]));
		two_one_mux mux2(.x(s02), .y(s12), .c(cin), .s(s[2]));
		two_one_mux mux3(.x(s03), .y(s13), .c(cin), .s(s[3]));
		
		//cout
//		two_one_mux mux_cout(.x(cout0), .y(cout1), .c(cin), .s(cout));
		
endmodule



module two_one_mux (input x, y, c,
 output logic s);
 
	assign s=(x & ~c) | (y & c);

endmodule


