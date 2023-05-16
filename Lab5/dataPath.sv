module datapath ( 
						input logic Clk, Reset, Run, Continue,
						input logic GatePC, GateMDR, GateALU, GateMARMUX,
						input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
						input logic SR2MUX, ADDR1MUX, DRMUX, SR1MUX, 
						input logic [1:0] PCMUX, ADDR2MUX, ALUK,
						input logic [15:0] MDR_In,
						input logic MIO_EN,
						output logic [15:0] MAR, MDR, IR,
						output logic BEN
);
	logic [2:0] CC, DR_Out, SR1MUX_Out;
	logic [3:0] Input;

	logic [15:0] SR2_OUT, SR1_OUT, B;
	logic BEN_IN;

	assign Input = {GatePC, GateMDR, GateALU, GateMARMUX};
	
	logic [15:0] out, MIOMUX_Out, PC_In, five_mux_out;
	
	
	logic [15:0] PC, ALU, MARMUX, ADDR2MUX_Out, ADDR1MUX_Out;
	
	five_one_mux busMux(.*,.In(Input), .out(five_mux_out));
	Register_File register_file(.*, .Data(five_mux_out), .SR1(SR1MUX_Out), .DRMUX(DR_Out), .SR2(IR[2:0]), .SR1_Out(SR1_OUT), .SR2_Out(SR2_OUT));
	
	
	reg_16 reg_PC(.*, .Reset(Reset), .Load(LD_PC), .D(PC_In), .Data_Out(PC));
	reg_16 reg_MAR(.*, .Reset(Reset), .Load(LD_MAR), .D(five_mux_out), .Data_Out(MAR));
	reg_16 reg_MDR(.*, .Reset(Reset), .Load(LD_MDR), .D(MIOMUX_Out), .Data_Out(MDR));
	reg_16 reg_IR(.*, .Reset(Reset), .Load(LD_IR), .D(five_mux_out), .Data_Out(IR));
	reg_1 Ben(.*, .Reset(Reset), .Load(LD_BEN), .D(BEN_IN), .Data_Out(BEN));
	
	logic N,Z,P;
	
	assign N = five_mux_out[15];
	assign Z = (five_mux_out == 16'h0000);
	assign P = ~five_mux_out[15] & ~Z;
	
	logic[2:0] CCIN;
	
	assign CCIN[0] = N;
	assign CCIN[1] = Z;
	assign CCIN[2] = P;
	
	reg_3 Cc(.*, .Reset(Reset), .Load(LD_CC), .D(CCIN), .Data_Out(CC));
	
	assign BEN_IN = (CC[2] & IR[11]) | (CC[1] & IR[10]) | (CC[0] & IR[9]);
	
	MDR_MUX MDR_MUX(.*, .Data(five_mux_out), .Data_to_CPU(MDR_In), .EN(MIO_EN), .Out(MIOMUX_Out));
	
	logic [15:0] SEXT_4, SEXT_5, SEXT_8, SEXT_10;
	
	assign SEXT_4 = {{11{IR[4]}}, IR[4:0]};
	assign SEXT_5 = {{10{IR[5]}}, IR[5:0]};
	assign SEXT_8 = {{7{IR[8]}}, IR[8:0]};
	assign SEXT_10 = {{5{IR[10]}}, IR[10:0]};
	
	
	logic [19:0] MAR_ZEXT;
	assign MAR_ZEXT[15:0] = MAR;
	
	//PC mux
	PCMUX pcMux(
		.PCMUX(PCMUX),
		.DataPath(five_mux_out),
		.ADDR(MARMUX),
		.PC_plus1(PC + 16'b1),
		.out(PC_In)
	);
	
	SR2MUX sr2mux(
		.SEXT5_0(SEXT_4),
		.SR2OUT(SR2_OUT),
		.Control(SR2MUX),
		.Out(B)
	);
	ADDr2MUX addr2mux(
		.SEXT10_0(SEXT_10),
		.SEXT8_0(SEXT_8),
		.SEXT5_0(SEXT_5),
		.ADDR2MUX_in(ADDR2MUX),
		.Out(ADDR2MUX_Out)
	);
	ADDr1MUX addr1mux(
		.SR1_OUT(SR1_OUT),
		.PC(PC_In),
		.ADDR1MUX_in(ADDR1MUX),
		.Out(ADDR1MUX_Out)
	);
	DRMUX drmux(
		.IR11_9(IR[11:9]),
		.DR(DRMUX),
		.Out(DR_Out)
	);
	SR1MUX sr1mux(
		.IR11_9(IR[11:9]),
		.IR8_6(IR[8:6]),
		.SR1(SR1MUX),
		.Out(SR1MUX_Out)
	);
	ALU alu(
		.B(B),
		.A(SR1_OUT),
		.ALUK(ALUK),
		.Out(ALU)
	);
	ripple_adder adder(
		.A(ADDR1MUX_Out),
		.B(ADDR2MUX_Out),
		.cin(1'b0),
		.S(MARMUX)
	);
	
	
endmodule

module five_one_mux (
							input logic [15:0] PC, MDR, ALU, MARMUX,
							input logic [3:0] In,
							output logic [15:0] out
);

	always_comb
		begin
				unique case(In)
						4'b1000 :  out = PC;
						4'b0100 :  out = MDR;
						4'b0010 :  out = ALU;
						4'b0001 :  out = MARMUX;
						default: out = 'h0;
				endcase
		end
endmodule

module MDR_MUX (
							input logic [15:0] Data, Data_to_CPU,
							input logic EN,
							output logic[15:0] Out
);
	always_comb
		begin
				unique case(EN)
						1'b1 :  Out = Data_to_CPU;
						1'b0 :  Out = Data;
						default: Out = 16'hxxxx;
				endcase
		end
endmodule

module DRMUX (
							input logic [2:0] IR11_9,
							input logic DR,
							output logic[2:0] Out
);
	always_comb
		begin
				unique case(DR)
						1'b1 :  Out = IR11_9;
						1'b0 :  Out = 3'b111;
						default: Out = 3'bxxx;
				endcase
		end
endmodule

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
						2'b00	:	out = PC_plus1;
						2'b01	:	out = DataPath;
						2'b10 :  out = ADDR;
						default: out = 16'h0000;
				endcase
		end


endmodule

module SR1MUX (
							input logic [2:0] IR11_9, IR8_6,
							input logic SR1,
							output logic[2:0] Out
);
	always_comb
		begin
				unique case(SR1)
						1'b0 :  Out = IR11_9;
						1'b1 :  Out = IR8_6;
						default: Out = 3'bxxx;
				endcase
		end
endmodule

module SR2MUX (
							input logic [15:0] SEXT5_0, SR2OUT,
							input logic Control,
							output logic[15:0] Out
);
	always_comb
		begin
				unique case(Control)
						1'b0 :  Out = SEXT5_0;
						1'b1 :  Out = SR2OUT;
						default: Out = 16'hxxxx;
				endcase
		end
endmodule

module ADDr1MUX (
							input logic [15:0] SR1_OUT, PC,
							input logic ADDR1MUX_in,
							output logic[15:0] Out
);
	always_comb
		begin
				unique case(ADDR1MUX_in)
						1'b0 :  Out = SR1_OUT;
						1'b1 :  Out = PC;
						default: Out = 16'hxxxx;
				endcase
		end
endmodule

module ADDr2MUX (
							input logic [15:0] SEXT10_0, SEXT8_0, SEXT5_0,
							input logic [1:0] ADDR2MUX_in,
							output logic[15:0] Out
);
	always_comb
		begin
				unique case(ADDR2MUX_in)
						2'b00 :  Out = SEXT10_0;
						2'b01 :  Out = SEXT8_0;
						2'b10 :  Out = SEXT5_0;
						2'b11 :  Out = 16'h0000;
						default: Out = 16'hxxxx;
				endcase
		end
endmodule

module ALU (
					input logic [15:0] B, A,
					input logic [1:0]  ALUK,
					output logic [15:0] Out
);
	always_comb
		begin
			unique case(ALUK)
				2'b00 :	Out = B + A;
				2'b01	:	Out = B & A;
				2'b10	:	Out = ~A;
				2'b11	:	Out = A;
				default:	Out = 16'hxxxx;
			endcase
		end
endmodule
