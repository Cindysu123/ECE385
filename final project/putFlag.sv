module putclearFlag (input flag, clr,
					input logic [7:0] reg_in,
					output logic [7:0] reg_out); 
					
		logic [7:0] regval;
		assign regval = reg_in + flag*64;
		assign reg_out = regval;
					
endmodule
