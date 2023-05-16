module Register_File(
					input logic Clk, Reset,
					input logic [15:0] Data,
					input logic [2:0] SR1,SR2,
					input logic [2:0] DRMUX,
					input logic LD_REG,
					output logic [15:0] SR1_Out, SR2_Out
);
	logic [2:0] DR_Out;
	logic [15:0] BR_Out, SR_Out;
	logic Load_DR, Load_BaseR, Load_SR;
	logic Load_R0, Load_R1, Load_R2, Load_R3, Load_R4, Load_R5, Load_R6, Load_R7;
	logic [15:0] R0_Out, R1_Out, R2_Out, R3_Out, R4_Out, R5_Out, R6_Out, R7_Out;
	always_comb
		begin
		Load_R0 = 1'b0;
		Load_R1 = 1'b0;
		Load_R2 = 1'b0;
		Load_R3 = 1'b0;
		Load_R4 = 1'b0;
		Load_R5 = 1'b0;
		Load_R6 = 1'b0;
		Load_R7 = 1'b0;
		
			unique case (DRMUX)
				3'b000 :
					Load_R0 = 1'b1;
				3'b001 :
					Load_R1 = 1'b1;
				3'b010 :
					Load_R2 = 1'b1;
				3'b011 :
					Load_R3 = 1'b1;
				3'b100 :
					Load_R4 = 1'b1;
				3'b101 :
					Load_R5 = 1'b1;
				3'b110 :
					Load_R6 = 1'b1;
				3'b111 :
					Load_R7 = 1'b1;
			endcase
		end
	
	reg_16 R0 (.*, .Load(Load_R0), .D(Data), .Data_Out(R0_Out));
	reg_16 R1 (.*, .Load(Load_R1), .D(Data), .Data_Out(R1_Out));
	reg_16 R2 (.*, .Load(Load_R2), .D(Data), .Data_Out(R2_Out));
	reg_16 R3 (.*, .Load(Load_R3), .D(Data), .Data_Out(R3_Out));
	reg_16 R4 (.*, .Load(Load_R4), .D(Data), .Data_Out(R4_Out));
	reg_16 R5 (.*, .Load(Load_R5), .D(Data), .Data_Out(R5_Out));
	reg_16 R6 (.*, .Load(Load_R6), .D(Data), .Data_Out(R6_Out));
	reg_16 R7 (.*, .Load(Load_R7), .D(Data), .Data_Out(R7_Out));
	
	always_comb
		begin
			case (SR2)
				3'b000 :
					SR2_Out = R0_Out;
				3'b001 :
					SR2_Out = R1_Out;
				3'b010 :
					SR2_Out = R2_Out;
				3'b011 :
					SR2_Out = R3_Out;
				3'b100 :
					SR2_Out = R4_Out;
				3'b101 :
					SR2_Out = R5_Out;
				3'b110 :
					SR2_Out = R6_Out;
				3'b111 :
					SR2_Out = R7_Out;
			endcase
		end
	always_comb
		begin
			case (SR1)
				3'b000 :
					SR1_Out = R0_Out;
				3'b001 :
					SR1_Out = R1_Out;
				3'b010 :
					SR1_Out = R2_Out;
				3'b011 :
					SR1_Out = R3_Out;
				3'b100 :
					SR1_Out = R4_Out;
				3'b101 :
					SR1_Out = R5_Out;
				3'b110 :
					SR1_Out = R6_Out;
				3'b111 :
					SR1_Out = R7_Out;
			endcase
		end	
	

endmodule
