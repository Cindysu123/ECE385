module reg_1 ( input		D, Clk, Load, 
					output logic Data_Out);
								
		always_ff @ (posedge Clk)
		begin
			if(Load)
				Data_Out <= D;
		end
		
endmodule
