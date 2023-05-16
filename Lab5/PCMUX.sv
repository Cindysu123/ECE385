module PCMUX(
				input logic [1:0] PCMUX,
				input logic [15:0] DataPath,
				input logic [15:0] ADDR,
				input logic [15:0] PC_plus1,
				output logic [15:0] out
);
	
	always_comb
		begin
				unique case(PCMUX)
						2'b00	:	out <= PC_plus1;
						2'b01	:	out <= DataPath;
						2'b10 :  out <= ADDR;
				endcase
		end


endmodule

