module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic PG0, GG0, PG4, GG4, PG8, GG8, PG12, GG12, C4, C8, C12;
	  four_bit_cla fbcla1(.x(A[3:0]), .y(B[3:0]), .cin(cin), .s(S[3:0]), .Pg(PG0), .Gg(GG0));
	  assign C4 = GG0 | (cin & PG0);
	  four_bit_cla fbcla2(.x(A[7:4]), .y(B[7:4]), .cin(C4), .s(S[7:4]), .Pg(PG4), .Gg(GG4));
	  assign C8 = GG4 | (GG0 & PG4) | (cin & PG0 & PG4);
	  four_bit_cla fbcla3(.x(A[11:8]), .y(B[11:8]), .cin(C8), .s(S[11:8]), .Pg(PG8), .Gg(GG8));
	  assign C12 = GG8 | (GG4 & PG8) | (GG0 & PG8 & PG4) | (cin & PG8 & PG4 & PG0);
	  four_bit_cla fbcla4(.x(A[15:12]), .y(B[15:12]), .cin(C12), .s(S[15:12]), .Pg(PG12), .Gg(GG12));
	  
	  

endmodule


module four_bit_cla(
						input [3:0] x,
						input [3:0] y,
						input cin,
						output logic [3:0] s,
						output logic Pg,
						output logic Gg
						);
						
		logic S0, S1, S2, S3; 
		logic P0, P1, P2, P3; 
		logic G0, G1, G2, G3;
		logic c1, c2, c3;
		
		full_adder_cla fa_cla0(.x(x[0]), .y(y[0]), .z(cin), .s(s[0]), .g(G0), .p(P0));
		assign c1 = (cin&P0)|G0;
		full_adder_cla fa_cla1(.x(x[1]), .y(y[1]), .z(c1), .s(s[1]), .g(G1), .p(P1));
		assign c2 = (cin&P1&P0)|(G0&P1)|G1;
		full_adder_cla fa_cla2(.x(x[2]), .y(y[2]), .z(c2), .s(s[2]), .g(G2), .p(P2));
		assign c3 = (cin&P0&P1&P2)|(G0&P1&P2)|(G1&P2)|G2;
		full_adder_cla fa_cla3(.x(x[3]), .y(y[3]), .z(c3), .s(s[3]), .g(G3), .p(P3));
		assign Pg = P0&P1&P2&P3;
		assign Gg = G3|(G2&P3)|(G1&P3&P2)|(G0&P3&P2&P1);
		
	endmodule


module full_adder_cla (input x, y, z,
 output s, g, p);
 
	assign s = x^y^z;
	assign c = (x&y)|(y&z)|(x&z);
	assign p = x^y;
	assign g = x&y;

	endmodule
	