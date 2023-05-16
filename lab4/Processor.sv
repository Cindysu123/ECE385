//Top level for ECE 385 adders lab
//modified for Spring 2023

//Note: lowest 2 HEX digits will reflect lower 8 bits of switch input
//Upper 4 HEX digits will reflect value in the accumulator


module Processor  (input Clk, Reset_Load_Clear, Run, 
						input [7:0]	  SW,
						output logic [9:0]	LED,
						output logic [7:0]	Aval, Bval,
						output logic [7:0]	HEX0, 
											HEX1, 
											HEX2, 
											HEX3, 
											HEX4,
											HEX5
										);

		// Declare temporary values used by other modules
		logic Shift_reg, Reset_Load_Clear_SH, Run_SH, M_II;
		logic [7:0] SW_S;
		logic fn, M, X, Clear_Load;
		logic [7:0] A, B;
		logic [8:0] Sum;
		logic [15:0] Out;
		logic Shift_X;
		//assign extended_SW = {6'b000000, SW};
		logic add;
		assign Shift_X = (add|fn);
		Control       Control_unit(
								//input
                        .Run(Run_SH),
                        .ClearA_LoadB(Reset_Load_Clear_SH),
								.Clk(Clk),
								.Reset(Reset_Load_Clear_SH),
								.M(M),
								//output
								.Clr_Ld(Clear_Load),
								.Shift(Shift_reg),
								.Add(add),
								.Sub(fn),
								.M_II(M_II)
                        );
		
		reg_unit		reg_u(
								//input
								.Clk(Clk),
								.Clear_Load(Clear_Load),
								.X_In(Sum[8]),    //Sum[8]
								.Shift_En(Shift_reg),
								.Shift_X(Shift_X),
								.Data_B(SW_S),
								.Data_A(Sum[7:0]),
								.SW(SW),
								.Load_A(add|fn),
								.M_II(M_II),
								//output
								.A(A),
								.B(B),
								.X_Out(X),
								.M(M)
								);
		
		
		ADD_SUB9 add_sub_unit(
								//input
								.A(A),
								.B(SW_S),
								.fn(fn),
								//output
								.S(Sum),
								.dataX(X)
								);
		
								
		assign Aval = A;
		assign Bval = B;
		// Hex units that display contents of SW and register R in hex
		HexDriver		SHex0 (
								.In0(SW[3:0]),
								.Out0(HEX0));
								
		HexDriver		SHex1 (
								.In0(SW[7:4]),
								.Out0(HEX1));
								
		HexDriver		BHex0 (
								.In0(Bval[3:0]),
								.Out0(HEX2) );
								
		HexDriver		BHex1 (
								.In0(Bval[7:4]),
								.Out0(HEX3) );
		
		HexDriver		AHex0 (
								.In0(Aval[3:0]),
								.Out0(HEX4) );
								
		HexDriver		AHex1 (
								.In0(Aval[7:4]),
								.Out0(HEX5) );
								
		
		//assign LED[1:0] = SW[9:8];
		assign LED[9] = Out[15];
		assign LED[8:2] = 7'h00;
		
		
	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
	  //These are array module instantiations
	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
	  //Note: We can invert the levels inside the port assignments
	  sync button_sync1 (Clk, ~Reset_Load_Clear, Reset_Load_Clear_SH);
	  sync button_sync2 (Clk, ~Run, Run_SH);
	  sync Din_sync[7:0] (Clk, SW, SW_S);
		
endmodule