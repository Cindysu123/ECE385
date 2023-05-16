module reg_unit
(	
					input logic Clk, Clear_Load, Load_A,
					input logic X_In, Shift_En, Shift_X, M_II,
					input logic [7:0] SW,
					input logic [7:0] Data_B,
					input logic [7:0] Data_A,
					output logic [7:0] A,
					output logic[7:0] B,
					output logic X_Out,
					output logic M
);
	logic shift_out_X, shift_out_A, shift_out_B, shift_out_S;
	
	reg_1 reg_X (.*, .Reset(Clear_Load), .Load(Shift_X), .D(X_In), .Data_Out(X_Out));
	//reg_1 reg_X2 (.*, .Reset(Clear_Load), .Load(Shift_En), .D(X_In), .Data_Out(X_Out));
	reg_8 reg_A (.*, .Reset(Clear_Load), .Shift_In(X_Out), .Load(Load_A), .Shift_En(Shift_En), .D(Data_A), .Shift_Out(shift_out_A), .Data_Out(A));
	reg_8 reg_B (.*, .Reset(1'b0), .Shift_In(shift_out_A), .Load(Clear_Load), .Shift_En(Shift_En), .D(Data_B), .Shift_Out(shift_out_B), .Data_Out(B));
	reg_8 reg_S (.*, .Reset(1'b0), .Shift_In(1'b0), .Load(Clear_Load), .Shift_En(1'b0), .D(SW), .Shift_Out(shift_out_S), .Data_Out(S));
	always_comb
	begin
	if (M_II)
		M = B[0];
	else
		M = B[1];
		
	end	
endmodule
