
`define NUM_REGS 168 
module content (
	input [31:0] indexxx,
	input [9:0] cursorx, cursory, 
	input flag, clear, frame_clk, start, clearFlag,
	output [7:0] value_out, deadd, numFlag, win
);

//	logic [7:0] Contents [`NUM_REGS]; // Registers
	
	logic [7:0] val_in;
	
	logic [31:0] Cursorindex;
	
	assign Cursorindex = cursory*14 + cursorx;
	
	//setflag
	logic Load_R1, Load_R2, Load_R3, Load_R4, Load_R5, Load_R6, Load_R7, Load_R8,
	Load_R9, Load_R10, Load_R11, Load_R12, Load_R13, Load_R14, Load_R15, Load_R16,
	Load_R17, Load_R18, Load_R19, Load_R20, Load_R21, Load_R22, Load_R23, Load_R24,
	Load_R25, Load_R26, Load_R27, Load_R28, Load_R29, Load_R30, 
	Load_R31, Load_R32, Load_R33, Load_R34, Load_R35, Load_R36, Load_R37, Load_R38, Load_R39, Load_R40,
	Load_R41, Load_R42, Load_R43, Load_R44, Load_R45, Load_R46, Load_R47, Load_R48, Load_R49, Load_R50,
	Load_R51, Load_R52, Load_R53, Load_R54, Load_R55, Load_R56, Load_R57, Load_R58, Load_R59, Load_R60,
	Load_R61, Load_R62, Load_R63, Load_R64, Load_R65, Load_R66, Load_R67, Load_R68, Load_R69, Load_R70,
	Load_R71, Load_R72, Load_R73, Load_R74, Load_R75, Load_R76, Load_R77, Load_R78, Load_R79, Load_R80,
	Load_R81, Load_R82, Load_R83, Load_R84, Load_R85, Load_R86, Load_R87, Load_R88, Load_R89, Load_R90,
	Load_R91, Load_R92, Load_R93, Load_R94, Load_R95, Load_R96, Load_R97, Load_R98, Load_R99, Load_R100,
	Load_R101, Load_R102, Load_R103, Load_R104, Load_R105, Load_R106, Load_R107, Load_R108, Load_R109, Load_R110,
	Load_R111, Load_R112, Load_R113, Load_R114, Load_R115, Load_R116, Load_R117, Load_R118, Load_R119, Load_R120,
	Load_R121, Load_R122, Load_R123, Load_R124, Load_R125, Load_R126, Load_R127, Load_R128, Load_R129, Load_R130,
	Load_R131, Load_R132, Load_R133, Load_R134, Load_R135, Load_R136, Load_R137, Load_R138, Load_R139, Load_R140,
	Load_R141, Load_R142, Load_R143, Load_R144, Load_R145, Load_R146, Load_R147, Load_R148, Load_R149, Load_R150,
	Load_R151, Load_R152, Load_R153, Load_R154, Load_R155, Load_R156, Load_R157, Load_R158, Load_R159, Load_R160,
	Load_R161, Load_R162, Load_R163, Load_R164, Load_R165, Load_R166, Load_R167, Load_R168;
	
	
	//clear
	logic Clear_R1, Clear_R2, Clear_R3, Clear_R4, Clear_R5, Clear_R6, Clear_R7, Clear_R8,
	Clear_R9, Clear_R10, Clear_R11, Clear_R12, Clear_R13, Clear_R14, Clear_R15, Clear_R16,
	Clear_R17, Clear_R18, Clear_R19, Clear_R20, Clear_R21, Clear_R22, Clear_R23, Clear_R24,
	Clear_R25, Clear_R26, Clear_R27, Clear_R28, Clear_R29, Clear_R30, 
	Clear_R31, Clear_R32, Clear_R33, Clear_R34, Clear_R35, Clear_R36, Clear_R37, Clear_R38, Clear_R39, Clear_R40,
	Clear_R41, Clear_R42, Clear_R43, Clear_R44, Clear_R45, Clear_R46, Clear_R47, Clear_R48, Clear_R49, Clear_R50,
	Clear_R51, Clear_R52, Clear_R53, Clear_R54, Clear_R55, Clear_R56, Clear_R57, Clear_R58, Clear_R59, Clear_R60,
	Clear_R61, Clear_R62, Clear_R63, Clear_R64, Clear_R65, Clear_R66, Clear_R67, Clear_R68, Clear_R69, Clear_R70,
	Clear_R71, Clear_R72, Clear_R73, Clear_R74, Clear_R75, Clear_R76, Clear_R77, Clear_R78, Clear_R79, Clear_R80,
	Clear_R81, Clear_R82, Clear_R83, Clear_R84, Clear_R85, Clear_R86, Clear_R87, Clear_R88, Clear_R89, Clear_R90,
	Clear_R91, Clear_R92, Clear_R93, Clear_R94, Clear_R95, Clear_R96, Clear_R97, Clear_R98, Clear_R99, Clear_R100,
	Clear_R101, Clear_R102, Clear_R103, Clear_R104, Clear_R105, Clear_R106, Clear_R107, Clear_R108, Clear_R109, Clear_R110,
	Clear_R111, Clear_R112, Clear_R113, Clear_R114, Clear_R115, Clear_R116, Clear_R117, Clear_R118, Clear_R119, Clear_R120,
	Clear_R121, Clear_R122, Clear_R123, Clear_R124, Clear_R125, Clear_R126, Clear_R127, Clear_R128, Clear_R129, Clear_R130,
	Clear_R131, Clear_R132, Clear_R133, Clear_R134, Clear_R135, Clear_R136, Clear_R137, Clear_R138, Clear_R139, Clear_R140,
	Clear_R141, Clear_R142, Clear_R143, Clear_R144, Clear_R145, Clear_R146, Clear_R147, Clear_R148, Clear_R149, Clear_R150,
	Clear_R151, Clear_R152, Clear_R153, Clear_R154, Clear_R155, Clear_R156, Clear_R157, Clear_R158, Clear_R159, Clear_R160,
	Clear_R161, Clear_R162, Clear_R163, Clear_R164, Clear_R165, Clear_R166, Clear_R167, Clear_R168;
	
	//clearFlag
	logic ClearF_R1, ClearF_R2, ClearF_R3, ClearF_R4, ClearF_R5, ClearF_R6, ClearF_R7, ClearF_R8,
	ClearF_R9, ClearF_R10, ClearF_R11, ClearF_R12, ClearF_R13, ClearF_R14, ClearF_R15, ClearF_R16,
	ClearF_R17, ClearF_R18, ClearF_R19, ClearF_R20, ClearF_R21, ClearF_R22, ClearF_R23, ClearF_R24,
	ClearF_R25, ClearF_R26, ClearF_R27, ClearF_R28, ClearF_R29, ClearF_R30, 
	ClearF_R31, ClearF_R32, ClearF_R33, ClearF_R34, ClearF_R35, ClearF_R36, ClearF_R37, ClearF_R38, ClearF_R39, ClearF_R40,
	ClearF_R41, ClearF_R42, ClearF_R43, ClearF_R44, ClearF_R45, ClearF_R46, ClearF_R47, ClearF_R48, ClearF_R49, ClearF_R50,
	ClearF_R51, ClearF_R52, ClearF_R53, ClearF_R54, ClearF_R55, ClearF_R56, ClearF_R57, ClearF_R58, ClearF_R59, ClearF_R60,
	ClearF_R61, ClearF_R62, ClearF_R63, ClearF_R64, ClearF_R65, ClearF_R66, ClearF_R67, ClearF_R68, ClearF_R69, ClearF_R70,
	ClearF_R71, ClearF_R72, ClearF_R73, ClearF_R74, ClearF_R75, ClearF_R76, ClearF_R77, ClearF_R78, ClearF_R79, ClearF_R80,
	ClearF_R81, ClearF_R82, ClearF_R83, ClearF_R84, ClearF_R85, ClearF_R86, ClearF_R87, ClearF_R88, ClearF_R89, ClearF_R90,
	ClearF_R91, ClearF_R92, ClearF_R93, ClearF_R94, ClearF_R95, ClearF_R96, ClearF_R97, ClearF_R98, ClearF_R99, ClearF_R100,
	ClearF_R101, ClearF_R102, ClearF_R103, ClearF_R104, ClearF_R105, ClearF_R106, ClearF_R107, ClearF_R108, ClearF_R109, ClearF_R110,
	ClearF_R111, ClearF_R112, ClearF_R113, ClearF_R114, ClearF_R115, ClearF_R116, ClearF_R117, ClearF_R118, ClearF_R119, ClearF_R120,
	ClearF_R121, ClearF_R122, ClearF_R123, ClearF_R124, ClearF_R125, ClearF_R126, ClearF_R127, ClearF_R128, ClearF_R129, ClearF_R130,
	ClearF_R131, ClearF_R132, ClearF_R133, ClearF_R134, ClearF_R135, ClearF_R136, ClearF_R137, ClearF_R138, ClearF_R139, ClearF_R140,
	ClearF_R141, ClearF_R142, ClearF_R143, ClearF_R144, ClearF_R145, ClearF_R146, ClearF_R147, ClearF_R148, ClearF_R149, ClearF_R150,
	ClearF_R151, ClearF_R152, ClearF_R153, ClearF_R154, ClearF_R155, ClearF_R156, ClearF_R157, ClearF_R158, ClearF_R159, ClearF_R160,
	ClearF_R161, ClearF_R162, ClearF_R163, ClearF_R164, ClearF_R165, ClearF_R166, ClearF_R167, ClearF_R168;
	
	
	//dead
	logic Dead_R1, Dead_R2, Dead_R3, Dead_R4, Dead_R5, Dead_R6, Dead_R7, Dead_R8,
	Dead_R9, Dead_R10, Dead_R11, Dead_R12, Dead_R13, Dead_R14, Dead_R15, Dead_R16,
	Dead_R17, Dead_R18, Dead_R19, Dead_R20, Dead_R21, Dead_R22, Dead_R23, Dead_R24,
	Dead_R25, Dead_R26, Dead_R27, Dead_R28, Dead_R29, Dead_R30, 
	Dead_R31, Dead_R32, Dead_R33, Dead_R34, Dead_R35, Dead_R36, Dead_R37, Dead_R38, Dead_R39, Dead_R40,
	Dead_R41, Dead_R42, Dead_R43, Dead_R44, Dead_R45, Dead_R46, Dead_R47, Dead_R48, Dead_R49, Dead_R50,
	Dead_R51, Dead_R52, Dead_R53, Dead_R54, Dead_R55, Dead_R56, Dead_R57, Dead_R58, Dead_R59, Dead_R60,
	Dead_R61, Dead_R62, Dead_R63, Dead_R64, Dead_R65, Dead_R66, Dead_R67, Dead_R68, Dead_R69, Dead_R70,
	Dead_R71, Dead_R72, Dead_R73, Dead_R74, Dead_R75, Dead_R76, Dead_R77, Dead_R78, Dead_R79, Dead_R80,
	Dead_R81, Dead_R82, Dead_R83, Dead_R84, Dead_R85, Dead_R86, Dead_R87, Dead_R88, Dead_R89, Dead_R90,
	Dead_R91, Dead_R92, Dead_R93, Dead_R94, Dead_R95, Dead_R96, Dead_R97, Dead_R98, Dead_R99, Dead_R100,
	Dead_R101, Dead_R102, Dead_R103, Dead_R104, Dead_R105, Dead_R106, Dead_R107, Dead_R108, Dead_R109, Dead_R110,
	Dead_R111, Dead_R112, Dead_R113, Dead_R114, Dead_R115, Dead_R116, Dead_R117, Dead_R118, Dead_R119, Dead_R120,
	Dead_R121, Dead_R122, Dead_R123, Dead_R124, Dead_R125, Dead_R126, Dead_R127, Dead_R128, Dead_R129, Dead_R130,
	Dead_R131, Dead_R132, Dead_R133, Dead_R134, Dead_R135, Dead_R136, Dead_R137, Dead_R138, Dead_R139, Dead_R140,
	Dead_R141, Dead_R142, Dead_R143, Dead_R144, Dead_R145, Dead_R146, Dead_R147, Dead_R148, Dead_R149, Dead_R150,
	Dead_R151, Dead_R152, Dead_R153, Dead_R154, Dead_R155, Dead_R156, Dead_R157, Dead_R158, Dead_R159, Dead_R160,
	Dead_R161, Dead_R162, Dead_R163, Dead_R164, Dead_R165, Dead_R166, Dead_R167, Dead_R168;
	
	
	logic [7:0] R1_Out, R2_Out, R3_Out, R4_Out, R5_Out, R6_Out, R7_Out, R8_Out, R9_Out, R10_Out,
	R11_Out, R12_Out, R13_Out, R14_Out, R15_Out, R16_Out, R17_Out, R18_Out, R19_Out, R20_Out,
	R21_Out, R22_Out, R23_Out, R24_Out, R25_Out, R26_Out, R27_Out, R28_Out, R29_Out, R30_Out,
	R31_Out, R32_Out, R33_Out, R34_Out, R35_Out, R36_Out, R37_Out, R38_Out, R39_Out, R40_Out,
	R41_Out, R42_Out, R43_Out, R44_Out, R45_Out, R46_Out, R47_Out, R48_Out, R49_Out, R50_Out,
	R51_Out, R52_Out, R53_Out, R54_Out, R55_Out, R56_Out, R57_Out, R58_Out, R59_Out, R60_Out,
	R61_Out, R62_Out, R63_Out, R64_Out, R65_Out, R66_Out, R67_Out, R68_Out, R69_Out, R70_Out,
	R71_Out, R72_Out, R73_Out, R74_Out, R75_Out, R76_Out, R77_Out, R78_Out, R79_Out, R80_Out,
	R81_Out, R82_Out, R83_Out, R84_Out, R85_Out, R86_Out, R87_Out, R88_Out, R89_Out, R90_Out,
	R91_Out, R92_Out, R93_Out, R94_Out, R95_Out, R96_Out, R97_Out, R98_Out, R99_Out, R100_Out,
	R101_Out, R102_Out, R103_Out, R104_Out, R105_Out, R106_Out, R107_Out, R108_Out, R109_Out, R110_Out,
	R111_Out, R112_Out, R113_Out, R114_Out, R115_Out, R116_Out, R117_Out, R118_Out, R119_Out, R120_Out,
	R121_Out, R122_Out, R123_Out, R124_Out, R125_Out, R126_Out, R127_Out, R128_Out, R129_Out, R130_Out,
	R131_Out, R132_Out, R133_Out, R134_Out, R135_Out, R136_Out, R137_Out, R138_Out, R139_Out, R140_Out,
	R141_Out, R142_Out, R143_Out, R144_Out, R145_Out, R146_Out, R147_Out, R148_Out, R149_Out, R150_Out,
	R151_Out, R152_Out, R153_Out, R154_Out, R155_Out, R156_Out, R167_Out, R158_Out, R159_Out, R160_Out,
	R161_Out, R162_Out, R163_Out, R164_Out, R165_Out, R166_Out, R157_Out, R168_Out;
	
	
	
	always_comb
		begin
		
		Load_R1 = 1'b0; Load_R2 = 1'b0; Load_R3 = 1'b0; Load_R4 = 1'b0; Load_R5 = 1'b0; Load_R6 = 1'b0; Load_R7 = 1'b0; Load_R8 = 1'b0; Load_R9 = 1'b0; Load_R10 = 1'b0;
		Load_R11 = 1'b0; Load_R12 = 1'b0; Load_R13 = 1'b0; Load_R14 = 1'b0; Load_R15 = 1'b0; Load_R16 = 1'b0; Load_R17 = 1'b0; Load_R18 = 1'b0; Load_R19 = 1'b0; Load_R20 = 1'b0;
		Load_R21 = 1'b0; Load_R22 = 1'b0; Load_R23 = 1'b0; Load_R24 = 1'b0; Load_R25 = 1'b0; Load_R26 = 1'b0; Load_R27 = 1'b0; Load_R28 = 1'b0; Load_R29 = 1'b0; Load_R30 = 1'b0;
		Load_R31 = 1'b0; Load_R32 = 1'b0; Load_R33 = 1'b0; Load_R34 = 1'b0; Load_R35 = 1'b0; Load_R36 = 1'b0; Load_R37 = 1'b0; Load_R38 = 1'b0; Load_R39 = 1'b0; Load_R40 = 1'b0;
		Load_R41 = 1'b0; Load_R42 = 1'b0; Load_R43 = 1'b0; Load_R44 = 1'b0; Load_R45 = 1'b0; Load_R46 = 1'b0; Load_R47 = 1'b0; Load_R48 = 1'b0; Load_R49 = 1'b0; Load_R50 = 1'b0;
		Load_R51 = 1'b0; Load_R52 = 1'b0; Load_R53 = 1'b0; Load_R54 = 1'b0; Load_R55 = 1'b0; Load_R56 = 1'b0; Load_R57 = 1'b0; Load_R58 = 1'b0; Load_R59 = 1'b0; Load_R60 = 1'b0;
		Load_R61 = 1'b0; Load_R62 = 1'b0; Load_R63 = 1'b0; Load_R64 = 1'b0; Load_R65 = 1'b0; Load_R66 = 1'b0; Load_R67 = 1'b0; Load_R68 = 1'b0; Load_R69 = 1'b0; Load_R70 = 1'b0;
		Load_R71 = 1'b0; Load_R72 = 1'b0; Load_R73 = 1'b0; Load_R74 = 1'b0; Load_R75 = 1'b0; Load_R76 = 1'b0; Load_R77 = 1'b0; Load_R78 = 1'b0; Load_R79 = 1'b0; Load_R80 = 1'b0;
		Load_R81 = 1'b0; Load_R82 = 1'b0; Load_R83 = 1'b0; Load_R84 = 1'b0; Load_R85 = 1'b0; Load_R86 = 1'b0; Load_R87 = 1'b0; Load_R88 = 1'b0; Load_R89 = 1'b0; Load_R90 = 1'b0;
		Load_R91 = 1'b0; Load_R92 = 1'b0; Load_R93 = 1'b0; Load_R94 = 1'b0; Load_R95 = 1'b0; Load_R96 = 1'b0; Load_R97 = 1'b0; Load_R98 = 1'b0; Load_R99 = 1'b0; Load_R100 = 1'b0;
		Load_R101 = 1'b0; Load_R102 = 1'b0; Load_R103 = 1'b0; Load_R104 = 1'b0; Load_R105 = 1'b0; Load_R106 = 1'b0; Load_R107 = 1'b0; Load_R108 = 1'b0; Load_R109 = 1'b0; Load_R110 = 1'b0;
		Load_R111 = 1'b0; Load_R112 = 1'b0; Load_R113 = 1'b0; Load_R114 = 1'b0; Load_R115 = 1'b0; Load_R116 = 1'b0; Load_R117 = 1'b0; Load_R118 = 1'b0; Load_R119 = 1'b0; Load_R120 = 1'b0;
		Load_R121 = 1'b0; Load_R122 = 1'b0; Load_R123 = 1'b0; Load_R124 = 1'b0; Load_R125 = 1'b0; Load_R126 = 1'b0; Load_R127 = 1'b0; Load_R128 = 1'b0; Load_R129 = 1'b0; Load_R130 = 1'b0;
		Load_R131 = 1'b0; Load_R132 = 1'b0; Load_R133 = 1'b0; Load_R134 = 1'b0; Load_R135 = 1'b0; Load_R136 = 1'b0; Load_R137 = 1'b0; Load_R138 = 1'b0; Load_R139 = 1'b0; Load_R140 = 1'b0;
		Load_R141 = 1'b0; Load_R142 = 1'b0; Load_R143 = 1'b0; Load_R144 = 1'b0; Load_R145 = 1'b0; Load_R146 = 1'b0; Load_R147 = 1'b0; Load_R148 = 1'b0; Load_R149 = 1'b0; Load_R150 = 1'b0;
		Load_R151 = 1'b0; Load_R152 = 1'b0; Load_R153 = 1'b0; Load_R154 = 1'b0; Load_R155 = 1'b0; Load_R156 = 1'b0; Load_R157 = 1'b0; Load_R158 = 1'b0; Load_R159 = 1'b0; Load_R160 = 1'b0;
		Load_R161 = 1'b0; Load_R162 = 1'b0; Load_R163 = 1'b0; Load_R164 = 1'b0; Load_R165 = 1'b0; Load_R166 = 1'b0; Load_R167 = 1'b0; Load_R168 = 1'b0; 
			
		
		Clear_R1 = 1'b0; Clear_R2 = 1'b0; Clear_R3 = 1'b0; Clear_R4 = 1'b0; Clear_R5 = 1'b0; Clear_R6 = 1'b0; Clear_R7 = 1'b0; Clear_R8 = 1'b0; Clear_R9 = 1'b0; Clear_R10 = 1'b0;
		Clear_R11 = 1'b0; Clear_R12 = 1'b0; Clear_R13 = 1'b0; Clear_R14 = 1'b0; Clear_R15 = 1'b0; Clear_R16 = 1'b0; Clear_R17 = 1'b0; Clear_R18 = 1'b0; Clear_R19 = 1'b0; Clear_R20 = 1'b0;
		Clear_R21 = 1'b0; Clear_R22 = 1'b0; Clear_R23 = 1'b0; Clear_R24 = 1'b0; Clear_R25 = 1'b0; Clear_R26 = 1'b0; Clear_R27 = 1'b0; Clear_R28 = 1'b0; Clear_R29 = 1'b0; Clear_R30 = 1'b0;
		Clear_R31 = 1'b0; Clear_R32 = 1'b0; Clear_R33 = 1'b0; Clear_R34 = 1'b0; Clear_R35 = 1'b0; Clear_R36 = 1'b0; Clear_R37 = 1'b0; Clear_R38 = 1'b0; Clear_R39 = 1'b0; Clear_R40 = 1'b0;
		Clear_R41 = 1'b0; Clear_R42 = 1'b0; Clear_R43 = 1'b0; Clear_R44 = 1'b0; Clear_R45 = 1'b0; Clear_R46 = 1'b0; Clear_R47 = 1'b0; Clear_R48 = 1'b0; Clear_R49 = 1'b0; Clear_R50 = 1'b0;
		Clear_R51 = 1'b0; Clear_R52 = 1'b0; Clear_R53 = 1'b0; Clear_R54 = 1'b0; Clear_R55 = 1'b0; Clear_R56 = 1'b0; Clear_R57 = 1'b0; Clear_R58 = 1'b0; Clear_R59 = 1'b0; Clear_R60 = 1'b0;
		Clear_R61 = 1'b0; Clear_R62 = 1'b0; Clear_R63 = 1'b0; Clear_R64 = 1'b0; Clear_R65 = 1'b0; Clear_R66 = 1'b0; Clear_R67 = 1'b0; Clear_R68 = 1'b0; Clear_R69 = 1'b0; Clear_R70 = 1'b0;
		Clear_R71 = 1'b0; Clear_R72 = 1'b0; Clear_R73 = 1'b0; Clear_R74 = 1'b0; Clear_R75 = 1'b0; Clear_R76 = 1'b0; Clear_R77 = 1'b0; Clear_R78 = 1'b0; Clear_R79 = 1'b0; Clear_R80 = 1'b0;
		Clear_R81 = 1'b0; Clear_R82 = 1'b0; Clear_R83 = 1'b0; Clear_R84 = 1'b0; Clear_R85 = 1'b0; Clear_R86 = 1'b0; Clear_R87 = 1'b0; Clear_R88 = 1'b0; Clear_R89 = 1'b0; Clear_R90 = 1'b0;
		Clear_R91 = 1'b0; Clear_R92 = 1'b0; Clear_R93 = 1'b0; Clear_R94 = 1'b0; Clear_R95 = 1'b0; Clear_R96 = 1'b0; Clear_R97 = 1'b0; Clear_R98 = 1'b0; Clear_R99 = 1'b0; Clear_R100 = 1'b0;
		Clear_R101 = 1'b0; Clear_R102 = 1'b0; Clear_R103 = 1'b0; Clear_R104 = 1'b0; Clear_R105 = 1'b0; Clear_R106 = 1'b0; Clear_R107 = 1'b0; Clear_R108 = 1'b0; Clear_R109 = 1'b0; Clear_R110 = 1'b0;
		Clear_R111 = 1'b0; Clear_R112 = 1'b0; Clear_R113 = 1'b0; Clear_R114 = 1'b0; Clear_R115 = 1'b0; Clear_R116 = 1'b0; Clear_R117 = 1'b0; Clear_R118 = 1'b0; Clear_R119 = 1'b0; Clear_R120 = 1'b0;
		Clear_R121 = 1'b0; Clear_R122 = 1'b0; Clear_R123 = 1'b0; Clear_R124 = 1'b0; Clear_R125 = 1'b0; Clear_R126 = 1'b0; Clear_R127 = 1'b0; Clear_R128 = 1'b0; Clear_R129 = 1'b0; Clear_R130 = 1'b0;
		Clear_R131 = 1'b0; Clear_R132 = 1'b0; Clear_R133 = 1'b0; Clear_R134 = 1'b0; Clear_R135 = 1'b0; Clear_R136 = 1'b0; Clear_R137 = 1'b0; Clear_R138 = 1'b0; Clear_R139 = 1'b0; Clear_R140 = 1'b0;
		Clear_R141 = 1'b0; Clear_R142 = 1'b0; Clear_R143 = 1'b0; Clear_R144 = 1'b0; Clear_R145 = 1'b0; Clear_R146 = 1'b0; Clear_R147 = 1'b0; Clear_R148 = 1'b0; Clear_R149 = 1'b0; Clear_R150 = 1'b0;
		Clear_R151 = 1'b0; Clear_R152 = 1'b0; Clear_R153 = 1'b0; Clear_R154 = 1'b0; Clear_R155 = 1'b0; Clear_R156 = 1'b0; Clear_R157 = 1'b0; Clear_R158 = 1'b0; Clear_R159 = 1'b0; Clear_R160 = 1'b0;
		Clear_R161 = 1'b0; Clear_R162 = 1'b0; Clear_R163 = 1'b0; Clear_R164 = 1'b0; Clear_R165 = 1'b0; Clear_R166 = 1'b0; Clear_R167 = 1'b0; Clear_R168 = 1'b0;
		
		ClearF_R1 = 1'b0; ClearF_R2 = 1'b0; ClearF_R3 = 1'b0; ClearF_R4 = 1'b0; ClearF_R5 = 1'b0; ClearF_R6 = 1'b0; ClearF_R7 = 1'b0; ClearF_R8 = 1'b0; ClearF_R9 = 1'b0; ClearF_R10 = 1'b0;
		ClearF_R11 = 1'b0; ClearF_R12 = 1'b0; ClearF_R13 = 1'b0; ClearF_R14 = 1'b0; ClearF_R15 = 1'b0; ClearF_R16 = 1'b0; ClearF_R17 = 1'b0; ClearF_R18 = 1'b0; ClearF_R19 = 1'b0; ClearF_R20 = 1'b0;
		ClearF_R21 = 1'b0; ClearF_R22 = 1'b0; ClearF_R23 = 1'b0; ClearF_R24 = 1'b0; ClearF_R25 = 1'b0; ClearF_R26 = 1'b0; ClearF_R27 = 1'b0; ClearF_R28 = 1'b0; ClearF_R29 = 1'b0; ClearF_R30 = 1'b0;
		ClearF_R31 = 1'b0; ClearF_R32 = 1'b0; ClearF_R33 = 1'b0; ClearF_R34 = 1'b0; ClearF_R35 = 1'b0; ClearF_R36 = 1'b0; ClearF_R37 = 1'b0; ClearF_R38 = 1'b0; ClearF_R39 = 1'b0; ClearF_R40 = 1'b0;
		ClearF_R41 = 1'b0; ClearF_R42 = 1'b0; ClearF_R43 = 1'b0; ClearF_R44 = 1'b0; ClearF_R45 = 1'b0; ClearF_R46 = 1'b0; ClearF_R47 = 1'b0; ClearF_R48 = 1'b0; ClearF_R49 = 1'b0; ClearF_R50 = 1'b0;
		ClearF_R51 = 1'b0; ClearF_R52 = 1'b0; ClearF_R53 = 1'b0; ClearF_R54 = 1'b0; ClearF_R55 = 1'b0; ClearF_R56 = 1'b0; ClearF_R57 = 1'b0; ClearF_R58 = 1'b0; ClearF_R59 = 1'b0; ClearF_R60 = 1'b0;
		ClearF_R61 = 1'b0; ClearF_R62 = 1'b0; ClearF_R63 = 1'b0; ClearF_R64 = 1'b0; ClearF_R65 = 1'b0; ClearF_R66 = 1'b0; ClearF_R67 = 1'b0; ClearF_R68 = 1'b0; ClearF_R69 = 1'b0; ClearF_R70 = 1'b0;
		ClearF_R71 = 1'b0; ClearF_R72 = 1'b0; ClearF_R73 = 1'b0; ClearF_R74 = 1'b0; ClearF_R75 = 1'b0; ClearF_R76 = 1'b0; ClearF_R77 = 1'b0; ClearF_R78 = 1'b0; ClearF_R79 = 1'b0; ClearF_R80 = 1'b0;
		ClearF_R81 = 1'b0; ClearF_R82 = 1'b0; ClearF_R83 = 1'b0; ClearF_R84 = 1'b0; ClearF_R85 = 1'b0; ClearF_R86 = 1'b0; ClearF_R87 = 1'b0; ClearF_R88 = 1'b0; ClearF_R89 = 1'b0; ClearF_R90 = 1'b0;
		ClearF_R91 = 1'b0; ClearF_R92 = 1'b0; ClearF_R93 = 1'b0; ClearF_R94 = 1'b0; ClearF_R95 = 1'b0; ClearF_R96 = 1'b0; ClearF_R97 = 1'b0; ClearF_R98 = 1'b0; ClearF_R99 = 1'b0; ClearF_R100 = 1'b0;
		ClearF_R101 = 1'b0; ClearF_R102 = 1'b0; ClearF_R103 = 1'b0; ClearF_R104 = 1'b0; ClearF_R105 = 1'b0; ClearF_R106 = 1'b0; ClearF_R107 = 1'b0; ClearF_R108 = 1'b0; ClearF_R109 = 1'b0; ClearF_R110 = 1'b0;
		ClearF_R111 = 1'b0; ClearF_R112 = 1'b0; ClearF_R113 = 1'b0; ClearF_R114 = 1'b0; ClearF_R115 = 1'b0; ClearF_R116 = 1'b0; ClearF_R117 = 1'b0; ClearF_R118 = 1'b0; ClearF_R119 = 1'b0; ClearF_R120 = 1'b0;
		ClearF_R121 = 1'b0; ClearF_R122 = 1'b0; ClearF_R123 = 1'b0; ClearF_R124 = 1'b0; ClearF_R125 = 1'b0; ClearF_R126 = 1'b0; ClearF_R127 = 1'b0; ClearF_R128 = 1'b0; ClearF_R129 = 1'b0; ClearF_R130 = 1'b0;
		ClearF_R131 = 1'b0; ClearF_R132 = 1'b0; ClearF_R133 = 1'b0; ClearF_R134 = 1'b0; ClearF_R135 = 1'b0; ClearF_R136 = 1'b0; ClearF_R137 = 1'b0; ClearF_R138 = 1'b0; ClearF_R139 = 1'b0; ClearF_R140 = 1'b0;
		ClearF_R141 = 1'b0; ClearF_R142 = 1'b0; ClearF_R143 = 1'b0; ClearF_R144 = 1'b0; ClearF_R145 = 1'b0; ClearF_R146 = 1'b0; ClearF_R147 = 1'b0; ClearF_R148 = 1'b0; ClearF_R149 = 1'b0; ClearF_R150 = 1'b0;
		ClearF_R151 = 1'b0; ClearF_R152 = 1'b0; ClearF_R153 = 1'b0; ClearF_R154 = 1'b0; ClearF_R155 = 1'b0; ClearF_R156 = 1'b0; ClearF_R157 = 1'b0; ClearF_R158 = 1'b0; ClearF_R159 = 1'b0; ClearF_R160 = 1'b0;
		ClearF_R161 = 1'b0; ClearF_R162 = 1'b0; ClearF_R163 = 1'b0; ClearF_R164 = 1'b0; ClearF_R165 = 1'b0; ClearF_R166 = 1'b0; ClearF_R167 = 1'b0; ClearF_R168 = 1'b0;
		
		
			
			unique case (Cursorindex)
				32'b00000000000000000000000000000000:
				begin
					Load_R1 = flag;
					Clear_R1 = clear;
					Clear_R2 = clear;
					Clear_R3 = clear;
					Clear_R15 = clear;
					Clear_R16 = clear;
					Clear_R17 = clear;
					ClearF_R1 = clearFlag;
					//number
					Clear_R4 = clear;
					Clear_R18 = clear;
					Clear_R29 = clear;
					Clear_R30 = clear;
					Clear_R31 = clear;
				end
				32'b00000000000000000000000000000001:
				begin
					Load_R2 = flag;
					Clear_R1 = clear;
					Clear_R2 = clear;
					Clear_R3 = clear;
					Clear_R15 = clear;
					Clear_R16 = clear;
					Clear_R17 = clear;
					ClearF_R2 = clearFlag;
					//number
					Clear_R4 = clear;
					Clear_R18 = clear;
					Clear_R29 = clear;
					Clear_R30 = clear;
					Clear_R31 = clear;
				end
				32'b00000000000000000000000000000010:
				begin
					Load_R3 = flag;
					Clear_R1 = clear;
					Clear_R2 = clear;
					Clear_R3 = clear;
					Clear_R15 = clear;
					Clear_R16 = clear;
					Clear_R17 = clear;
					ClearF_R3 = clearFlag;
					//number
					Clear_R4 = clear;
					Clear_R18 = clear;
					Clear_R29 = clear;
					Clear_R30 = clear;
					Clear_R31 = clear;
				end
				32'b00000000000000000000000000000011:
				begin
					Load_R4 = flag;
					Clear_R4 = clear;
					ClearF_R4 = clearFlag;
				end
				32'b00000000000000000000000000000100:
				begin
					Load_R5 = flag;
					Clear_R5 = clear;
					ClearF_R5 = clearFlag;
				end
				32'b00000000000000000000000000000101:
				begin
					Load_R6 = flag;
					Clear_R6 = clear;
					ClearF_R6 = clearFlag;
				end
				32'b00000000000000000000000000000110:
				begin
					Load_R7 = flag;
					Clear_R7 = clear;
					ClearF_R7 = clearFlag;
				end
				32'b00000000000000000000000000000111:
				begin
					Load_R8 = flag;
					Clear_R8 = clear;
					ClearF_R8 = clearFlag;
				end
				32'b00000000000000000000000000001000:
				begin
					Load_R9 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R9 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000000001001:
				begin
					Load_R10 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R10 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000000001010:
				begin
					Load_R11 = flag;
					Clear_R11 = clear;
					ClearF_R11 = clearFlag;
				end
				32'b00000000000000000000000000001011:
				begin
					Load_R12 = flag;
					Clear_R12 = clear;
					ClearF_R12 = clearFlag;
				end
				32'b00000000000000000000000000001100:
				begin
					Load_R13 = flag;
					Clear_R13 = clear;
					ClearF_R13 = clearFlag;
				end
				32'b00000000000000000000000000001101:
				begin
					Load_R14 = flag;
					Clear_R14 = clear;
					ClearF_R14 = clearFlag;
					//number
					Clear_R13 = clear;
					Clear_R28 = clear;
				end
				32'b00000000000000000000000000001110:
				begin
					Load_R15 = flag;
					Clear_R1 = clear;
					Clear_R2 = clear;
					Clear_R3 = clear;
					Clear_R15 = clear;
					Clear_R16 = clear;
					Clear_R17 = clear;
					ClearF_R15 = clearFlag;
					//number
					Clear_R4 = clear;
					Clear_R18 = clear;
					Clear_R29 = clear;
					Clear_R30 = clear;
					Clear_R31 = clear;
				end
				32'b00000000000000000000000000001111:
				begin
					Load_R16 = flag;
					Clear_R1 = clear;
					Clear_R2 = clear;
					Clear_R3 = clear;
					Clear_R15 = clear;
					Clear_R16 = clear;
					Clear_R17 = clear;
					ClearF_R16 = clearFlag;
					//number
					Clear_R4 = clear;
					Clear_R18 = clear;
					Clear_R29 = clear;
					Clear_R30 = clear;
					Clear_R31 = clear;
				end
				32'b00000000000000000000000000010000:
				begin
					Load_R17 = flag;
					Clear_R1 = clear;
					Clear_R2 = clear;
					Clear_R3 = clear;
					Clear_R15 = clear;
					Clear_R16 = clear;
					Clear_R17 = clear;
					ClearF_R17 = clearFlag;
					//number
					Clear_R4 = clear;
					Clear_R18 = clear;
					Clear_R29 = clear;
					Clear_R30 = clear;
					Clear_R31 = clear;
				end
				32'b00000000000000000000000000010001:
				begin
					Load_R18 = flag;
					Clear_R18 = clear;
					ClearF_R18 = clearFlag;
				end
				32'b00000000000000000000000000010010:
				begin
					Load_R19 = flag;
					Clear_R19 = clear;
					ClearF_R19 = clearFlag;
				end
				32'b00000000000000000000000000010011:
				begin
					Load_R20 = flag;
					Clear_R20 = clear;
					ClearF_R20 = clearFlag;
				end
				32'b00000000000000000000000000010100:
				begin
					Load_R21 = flag;
					Clear_R21 = clear;
					ClearF_R21 = clearFlag;
				end
				32'b00000000000000000000000000010101:
				begin
					Load_R22 = flag;
					Clear_R22 = clear;
					ClearF_R22 = clearFlag;
				end
				32'b00000000000000000000000000010110:
				begin
					Load_R23 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R23 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000000010111:
				begin
					Load_R24 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R24 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000000011000:
				begin
					Load_R25 = flag;
					Clear_R25 = clear;
					ClearF_R25 = clearFlag;
				end
				32'b00000000000000000000000000011001:
				begin
					Load_R26 = flag;
					Clear_R26 = clear;
					ClearF_R26 = clearFlag;
				end
				32'b00000000000000000000000000011010:
				begin
					Load_R27 = flag;
					Clear_R27 = clear;
					ClearF_R27 = clearFlag;
				end
				32'b00000000000000000000000000011011:
				begin
					Load_R28 = flag;
					Clear_R28 = clear;
					ClearF_R28 = clearFlag;
				end
				32'b00000000000000000000000000011100:
				begin
					Load_R29 = flag;
					Clear_R29 = clear;
					ClearF_R29 = clearFlag;
				end
				32'b00000000000000000000000000011101:
				begin
					Load_R30 = flag;
					Clear_R30 = clear;
					ClearF_R30 = clearFlag;
				end
				32'b00000000000000000000000000011110:
				begin
					Load_R31 = flag;
					Clear_R31 = clear;
					ClearF_R31 = clearFlag;
				end
				32'b00000000000000000000000000011111:
				begin
					Load_R32 = flag;
					Clear_R32 = clear;
					ClearF_R32 = clearFlag;
				end
				32'b00000000000000000000000000100000:
				begin
					Load_R33 = flag;
					Clear_R33 = clear;
					ClearF_R33 = clearFlag;
				end
				32'b00000000000000000000000000100001:
				begin
					Load_R34 = flag;
					Clear_R34 = clear;
					ClearF_R34 = clearFlag;
				end
				32'b00000000000000000000000000100010:
				begin
					Load_R35 = flag;
					Clear_R35 = clear;
					ClearF_R35 = clearFlag;
				end
				32'b00000000000000000000000000100011:
				begin
					Load_R36 = flag;
					Clear_R36 = clear;
					ClearF_R36 = clearFlag;
				end
				32'b00000000000000000000000000100100:
				begin
					Load_R37 = flag;
					Clear_R37 = clear;
					ClearF_R37 = clearFlag;
				end
				32'b00000000000000000000000000100101:
				begin
					Load_R38 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R38 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000000100110:
				begin
					Load_R39 = flag;
					Clear_R39 = clear;
					ClearF_R39 = clearFlag;
				end
				32'b00000000000000000000000000100111:
				begin
					Load_R40 = flag;
					Clear_R40 = clear;
					ClearF_R40 = clearFlag;
				end
				32'b00000000000000000000000000101000:
				begin
					Load_R41 = flag;
					Clear_R41 = clear;
					ClearF_R41 = clearFlag;
				end
				32'b00000000000000000000000000101001:
				begin
					Load_R42 = flag;
					Clear_R42 = clear;
					ClearF_R42 = clearFlag;
				end
				32'b00000000000000000000000000101010:
				begin
					Load_R43 = flag;
					Clear_R43 = clear;
					ClearF_R43 = clearFlag;
				end
				32'b00000000000000000000000000101011:
				begin
					Load_R44 = flag;
					Clear_R44 = clear;
					ClearF_R44 = clearFlag;
				end
				32'b00000000000000000000000000101100:
				begin
					Load_R45 = flag;
					Clear_R45 = clear;
					ClearF_R45 = clearFlag;
				end
				32'b00000000000000000000000000101101:
				begin
					Load_R46 = flag;
					Clear_R46 = clear;
					ClearF_R46 = clearFlag;
				end
				32'b00000000000000000000000000101110:
				begin
					Load_R47 = flag;
					Clear_R47 = clear;
					ClearF_R47 = clearFlag;
				end
				32'b00000000000000000000000000101111:
				begin
					Load_R48 = flag;
					Clear_R48 = clear;
					ClearF_R48 = clearFlag;
				end
				32'b00000000000000000000000000110000:
				begin
					Load_R49 = flag;
					Clear_R49 = clear;
					ClearF_R49 = clearFlag;
				end
				32'b00000000000000000000000000110001:
				begin
					Load_R50 = flag;
					Clear_R50 = clear;
					ClearF_R50 = clearFlag;
				end
				32'b00000000000000000000000000110010:
				begin
					Load_R51 = flag;
					Clear_R51 = clear;
					ClearF_R51 = clearFlag;
				end
				32'b00000000000000000000000000110011:
				begin
					Load_R52 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R52 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000000110100:
				begin
					Load_R53 = flag;
					Clear_R53 = clear;
					ClearF_R53 = clearFlag;
				end
				32'b00000000000000000000000000110101:
				begin
					Load_R54 = flag;
					Clear_R54 = clear;
					ClearF_R54 = clearFlag;
				end
				32'b00000000000000000000000000110110:
				begin
					Load_R55 = flag;
					Clear_R55 = clear;
					ClearF_R55 = clearFlag;
				end
				32'b00000000000000000000000000110111:
				begin
					Load_R56 = flag;
					Clear_R56 = clear;
					ClearF_R56 = clearFlag;
				end
				32'b00000000000000000000000000111000:
				begin
					Load_R57 = flag;
					Clear_R57 = clear;
					ClearF_R57 = clearFlag;
				end
				32'b00000000000000000000000000111001:
				begin
					Load_R58 = flag;
					Clear_R58 = clear;
					ClearF_R58 = clearFlag;
				end
				32'b00000000000000000000000000111010:
				begin
					Load_R59 = flag;
					Clear_R59 = clear;
					ClearF_R59 = clearFlag;
				end
				32'b00000000000000000000000000111011:
				begin
					Load_R60 = flag;
					Clear_R60 = clear;
					ClearF_R60 = clearFlag;
				end
				32'b00000000000000000000000000111100:
				begin
					Load_R61 = flag;
					Clear_R61 = clear;
					ClearF_R61 = clearFlag;
				end
				32'b00000000000000000000000000111101:
				begin
					Load_R62 = flag;
					Clear_R62 = clear;
					ClearF_R62 = clearFlag;
				end
				32'b00000000000000000000000000111110:
				begin
					Load_R63 = flag;
					Clear_R63 = clear;
					ClearF_R63 = clearFlag;
				end
				32'b00000000000000000000000000111111:
				begin
					Load_R64 = flag;
					Clear_R64 = clear;
					ClearF_R64 = clearFlag;
				end
				32'b00000000000000000000000001000000:
				begin
					Load_R65 = flag;
					Clear_R65 = clear;
					ClearF_R65 = clearFlag;
				end
				32'b00000000000000000000000001000001:
				begin
					Load_R66 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R66 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000001000010:
				begin
					Load_R67 = flag;
					Clear_R67 = clear;
					ClearF_R67 = clearFlag;
				end
				32'b00000000000000000000000001000011:
				begin
					Load_R68 = flag;
					Clear_R68 = clear;
					ClearF_R68 = clearFlag;
				end
				32'b00000000000000000000000001000100:
				begin
					Load_R69 = flag;
					Clear_R69 = clear;
					ClearF_R69 = clearFlag;
				end
				32'b00000000000000000000000001000101:
				begin
					Load_R70 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R70 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001000110:
				begin
					Load_R71 = flag;
					Clear_R71 = clear;
					Clear_R72 = clear;
					Clear_R85 = clear;
					Clear_R86 = clear;
					Clear_R99 = clear;
					Clear_R113 = clear;
					ClearF_R71 = clearFlag;
					//number
					Clear_R57 = clear;
					Clear_R58 = clear;
					Clear_R73 = clear;
					Clear_R87 = clear;
					Clear_R100 = clear;
					Clear_R114 = clear;
					Clear_R100 = clear;
					Clear_R127 = clear;
				end
				32'b00000000000000000000000001000111:
				begin
					Load_R72 = flag;
					Clear_R71 = clear;
					Clear_R72 = clear;
					Clear_R85 = clear;
					Clear_R86 = clear;
					Clear_R99 = clear;
					Clear_R113 = clear;
					ClearF_R72 = clearFlag;
					//number
					Clear_R57 = clear;
					Clear_R58 = clear;
					Clear_R73 = clear;
					Clear_R87 = clear;
					Clear_R100 = clear;
					Clear_R114 = clear;
					Clear_R100 = clear;
					Clear_R127 = clear;
				end
				32'b00000000000000000000000001001000:
				begin
					Load_R73 = flag;
					Clear_R73 = clear;
					ClearF_R73 = clearFlag;
				end
				32'b00000000000000000000000001001001:
				begin
					Load_R74 = flag;
					Clear_R74 = clear;
					ClearF_R74 = clearFlag;
				end
				32'b00000000000000000000000001001010:
				begin
					Load_R75 = flag;
					Clear_R75 = clear;
					ClearF_R75 = clearFlag;
				end
				32'b00000000000000000000000001001011:
				begin
					Load_R76 = flag;
					Clear_R76 = clear;
					ClearF_R76 = clearFlag;
				end
				32'b00000000000000000000000001001100:
				begin
					Load_R77 = flag;
					Clear_R77 = clear;
					ClearF_R77 = clearFlag;
				end
				32'b00000000000000000000000001001101:
				begin
					Load_R78 = flag;
					Clear_R78 = clear;
					ClearF_R78 = clearFlag;
				end
				32'b00000000000000000000000001001110:
				begin
					Load_R79 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R79 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000001001111:
				begin
					Load_R80 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R80 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000001010000:
				begin
					Load_R81 = flag;
					Clear_R81 = clear;
					ClearF_R81 = clearFlag;
				end
				32'b00000000000000000000000001010001:
				begin
					Load_R82 = flag;
					Clear_R82 = clear;
					ClearF_R82 = clearFlag;
				end
				32'b00000000000000000000000001010010:
				begin
					Load_R83 = flag;
					Clear_R83 = clear;
					ClearF_R83 = clearFlag;
				end
				32'b00000000000000000000000001010011:
				begin
					Load_R84 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R84 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001010100:
				begin
					Load_R85 = flag;
					Clear_R71 = clear;
					Clear_R72 = clear;
					Clear_R85 = clear;
					Clear_R86 = clear;
					Clear_R99 = clear;
					Clear_R113 = clear;
					ClearF_R85 = clearFlag;
					//number
					Clear_R57 = clear;
					Clear_R58 = clear;
					Clear_R73 = clear;
					Clear_R87 = clear;
					Clear_R100 = clear;
					Clear_R114 = clear;
					Clear_R100 = clear;
					Clear_R127 = clear;
				end
				32'b00000000000000000000000001010101:
				begin
					Load_R86 = flag;
					Clear_R71 = clear;
					Clear_R72 = clear;
					Clear_R85 = clear;
					Clear_R86 = clear;
					Clear_R99 = clear;
					Clear_R113 = clear;
					ClearF_R86 = clearFlag;
					//number
					Clear_R57 = clear;
					Clear_R58 = clear;
					Clear_R73 = clear;
					Clear_R87 = clear;
					Clear_R100 = clear;
					Clear_R114 = clear;
					Clear_R100 = clear;
					Clear_R127 = clear;
				end
				32'b00000000000000000000000001010110:
				begin
					Load_R87 = flag;
					Clear_R87 = clear;
					ClearF_R87 = clearFlag;
				end	
				32'b00000000000000000000000001010111:
				begin
					Load_R88 = flag;
					Clear_R88 = clear;
					ClearF_R88 = clearFlag;
				end
				32'b00000000000000000000000001011000:
				begin
					Load_R89 = flag;
					Clear_R89 = clear;
					ClearF_R89 = clearFlag;
				end
				32'b00000000000000000000000001011001:
				begin
					Load_R90 = flag;
					Clear_R90 = clear;
					ClearF_R90 = clearFlag;
				end
				32'b00000000000000000000000001011010:
				begin
					Load_R91 = flag;
					Clear_R91 = clear;
					ClearF_R91 = clearFlag;
				end
				32'b00000000000000000000000001011011:
				begin
					Load_R92 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R92 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				
				32'b00000000000000000000000001011100:
				begin
					Load_R93 = flag;
					Clear_R9 = clear;
					Clear_R10 = clear;
					Clear_R23 = clear;
					Clear_R24 = clear;
					Clear_R38 = clear;
					Clear_R52 = clear;
					Clear_R66 = clear;
					Clear_R79 = clear;
					Clear_R80 = clear;
					Clear_R92 = clear;
					Clear_R93 = clear;
					ClearF_R93 = clearFlag;
					//clear numbers
					Clear_R8 = clear;
					Clear_R22 = clear;
					Clear_R36 = clear;
					Clear_R37 = clear;
					Clear_R51 = clear;
					Clear_R64 = clear;
					Clear_R65 = clear;
					Clear_R77 = clear;
					Clear_R78 = clear;
					Clear_R91 = clear;
					Clear_R105 = clear;
					Clear_R106 = clear;
					Clear_R107 = clear;
					Clear_R108 = clear;
					Clear_R94 = clear;
					Clear_R95 = clear;
					Clear_R81 = clear;
					Clear_R67 = clear;
					Clear_R53 = clear;
					Clear_R39 = clear;
					Clear_R25 = clear;
					Clear_R11 = clear;
				end
				32'b00000000000000000000000001011101:
				begin
					Load_R94 = flag;
					Clear_R94 = clear;
					ClearF_R94 = clearFlag;
				end
				32'b00000000000000000000000001011110:
				begin
					Load_R95 = flag;
					Clear_R95 = clear;
					ClearF_R95 = clearFlag;
				end
				32'b00000000000000000000000001011111:
				begin
					Load_R96 = flag;
					Clear_R96 = clear;
					ClearF_R96 = clearFlag;
				end
				32'b00000000000000000000000001100000:
				begin
					Load_R97 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R97 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001100001:
				begin
					Load_R98 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R98 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001100010:
				begin
					Load_R99 = flag;
					Clear_R71 = clear;
					Clear_R72 = clear;
					Clear_R85 = clear;
					Clear_R86 = clear;
					Clear_R99 = clear;
					Clear_R113 = clear;
					ClearF_R99 = clearFlag;
					//number
					Clear_R57 = clear;
					Clear_R58 = clear;
					Clear_R73 = clear;
					Clear_R87 = clear;
					Clear_R100 = clear;
					Clear_R114 = clear;
					Clear_R100 = clear;
					Clear_R127 = clear;
				end
				32'b00000000000000000000000001100011:
				begin
					Load_R100 = flag;
					Clear_R100 = clear;
					ClearF_R100 = clearFlag;
				end
			endcase
			unique case (Cursorindex)
			
				32'b00000000000000000000000001100100:
				begin
					Load_R101 = flag;
					Clear_R101 = clear;
					ClearF_R101 = clearFlag;
				end
				32'b00000000000000000000000001100101:
				begin
					Load_R102 = flag;
					Clear_R102 = clear;
					ClearF_R102 = clearFlag;
				end
				32'b00000000000000000000000001100110:
				begin
					Load_R103 = flag;
					Clear_R103 = clear;
					ClearF_R103 = clearFlag;
				end
				32'b00000000000000000000000001100111:
				begin
					Load_R104 = flag;
					Clear_R104 = clear;
					ClearF_R104 = clearFlag;
				end
				32'b00000000000000000000000001101000:
				begin
					Load_R105 = flag;
					Clear_R105 = clear;
					ClearF_R105 = clearFlag;
				end
				32'b00000000000000000000000001101001:
				begin
					Load_R106 = flag;
					Clear_R106 = clear;
					ClearF_R106 = clearFlag;
				end
				32'b00000000000000000000000001101010:
				begin
					Load_R107 = flag;
					Clear_R107 = clear;
					ClearF_R107 = clearFlag;
				end
				32'b00000000000000000000000001101011:
				begin
					Load_R108 = flag;
					Clear_R108 = clear;
					ClearF_R108 = clearFlag;
				end
				32'b00000000000000000000000001101100:
				begin
					Load_R109 = flag;
					Clear_R109 = clear;
					ClearF_R109 = clearFlag;
				end
				32'b00000000000000000000000001101101:
				begin
					Load_R110 = flag;
					Clear_R110 = clear;
					ClearF_R110 = clearFlag;
				end
				32'b00000000000000000000000001101110:
				begin
					Load_R111 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R111 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001101111:
				begin
					Load_R112 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R112 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001110000:
				begin
					Load_R113 = flag;
					Clear_R71 = clear;
					Clear_R72 = clear;
					Clear_R85 = clear;
					Clear_R86 = clear;
					Clear_R99 = clear;
					Clear_R113 = clear;
					ClearF_R113 = clearFlag;
					//number
					Clear_R57 = clear;
					Clear_R58 = clear;
					Clear_R73 = clear;
					Clear_R87 = clear;
					Clear_R100 = clear;
					Clear_R114 = clear;
					Clear_R100 = clear;
					Clear_R127 = clear;
				end
				32'b00000000000000000000000001110001:
				begin
					Load_R114 = flag;
					Clear_R114 = clear;
					ClearF_R114 = clearFlag;
				end
				32'b00000000000000000000000001110010:
				begin
					Load_R115 = flag;
					Clear_R115 = clear;
					ClearF_R115 = clearFlag;
				end
				32'b00000000000000000000000001110011:
				begin
					Load_R116 = flag;
					Clear_R116 = clear;
					ClearF_R116 = clearFlag;
				end
				32'b00000000000000000000000001110100:
				begin
					Load_R117 = flag;
					Clear_R117 = clear;
					ClearF_R117 = clearFlag;
				end
				32'b00000000000000000000000001110101:
				begin
					Load_R118 = flag;
					Clear_R118 = clear;
					ClearF_R118 = clearFlag;
				end
				32'b00000000000000000000000001110110:
				begin
					Load_R119 = flag;
					Clear_R119 = clear;
					ClearF_R119 = clearFlag;
				end
				32'b00000000000000000000000001110111:
				begin
					Load_R120 = flag;
					Clear_R120 = clear;
					ClearF_R120 = clearFlag;
				end
				32'b00000000000000000000000001111000:
				begin
					Load_R121 = flag;
					Clear_R121 = clear;
				end
				32'b00000000000000000000000001111001:
				begin
					Load_R122 = flag;
					Clear_R122 = clear;
					ClearF_R122 = clearFlag;
				end
				32'b00000000000000000000000001111010:
				begin
					Load_R123 = flag;
					Clear_R123 = clear;
					ClearF_R123 = clearFlag;
				end
				32'b00000000000000000000000001111011:
				begin
					Load_R124 = flag;
					Clear_R124 = clear;
					ClearF_R124 = clearFlag;
				end
				32'b00000000000000000000000001111100:
				begin
					Load_R125 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R125 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001111101:
				begin
					Load_R126 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R126 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000001111110:
				begin
					Load_R127 = flag;
					Clear_R127 = clear;
					ClearF_R127 = clearFlag;
				end
				32'b00000000000000000000000001111111:
				begin
					Load_R128 = flag;
					Clear_R128 = clear;
					ClearF_R128 = clearFlag;
				end
				32'b00000000000000000000000010000000:
				begin
					Load_R129 = flag;
					Clear_R129 = clear;
					ClearF_R129 = clearFlag;
				end
				32'b00000000000000000000000010000001:
				begin
					Load_R130 = flag;
					Clear_R130 = clear;
					ClearF_R130 = clearFlag;
				end
				32'b00000000000000000000000010000010:
				begin
					Load_R131 = flag;
					Clear_R131 = clear;
					ClearF_R131 = clearFlag;
				end
				32'b00000000000000000000000010000011:
				begin
					Load_R132 = flag;
					Clear_R132 = clear;
					ClearF_R132 = clearFlag;
				end
				32'b00000000000000000000000010000100:
				begin
					Load_R133 = flag;
					Clear_R133 = clear;
					ClearF_R133 = clearFlag;
				end
				32'b00000000000000000000000010000101:
				begin
					Load_R134 = flag;
					Clear_R134 = clear;
					ClearF_R134 = clearFlag;
				end
				32'b00000000000000000000000010000110:
				begin
					Load_R135 = flag;
					Clear_R135 = clear;
					ClearF_R135 = clearFlag;
				end
				32'b00000000000000000000000010000111:
				begin
					Load_R136 = flag;
					Clear_R136 = clear;
					ClearF_R136 = clearFlag;
				end
				32'b00000000000000000000000010001000:
				begin
					Load_R137 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R137 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010001001:
				begin
					Load_R138 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R138 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010001010:
				begin
					Load_R139 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R139 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010001011:
				begin
					Load_R140 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R140 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010001100:
				begin
					Load_R141 = flag;
					Clear_R141 = clear;
					ClearF_R141 = clearFlag;
				end
				32'b00000000000000000000000010001101:
				begin
					Load_R142 = flag;
					Clear_R142 = clear;
					ClearF_R142 = clearFlag;
				end
				32'b00000000000000000000000010001110:
				begin
					Load_R143 = flag;
					Clear_R143 = clear;
					ClearF_R143 = clearFlag;
				end
				32'b00000000000000000000000010001111:
				begin
					Load_R144 = flag;
					Clear_R144 = clear;
					ClearF_R144 = clearFlag;
				end
				32'b00000000000000000000000010010000:
				begin
					Load_R145 = flag;
					Clear_R145 = clear;
					ClearF_R145 = clearFlag;
				end
				32'b00000000000000000000000010010001:
				begin
					Load_R146 = flag;
					Clear_R146 = clear;
					ClearF_R146 = clearFlag;
				end
				32'b00000000000000000000000010010010:
				begin
					Load_R147 = flag;
					Clear_R147 = clear;
					ClearF_R147 = clearFlag;
				end
				32'b00000000000000000000000010010011:
				begin
					Load_R148 = flag;
					Clear_R148 = clear;
					ClearF_R148 = clearFlag;
				end
				32'b00000000000000000000000010010100:
				begin
					Load_R149 = flag;
					Clear_R149 = clear;
					ClearF_R149 = clearFlag;
				end
				32'b00000000000000000000000010010101:
				begin
					Load_R150 = flag;
					Clear_R150 = clear;
					ClearF_R150 = clearFlag;
				end
				32'b00000000000000000000000010010110:
				begin
					Load_R151 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R151 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010010111:
				begin
					Load_R152 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R152 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010011000:
				begin
					Load_R153 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R153 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010011001:
				begin
					Load_R154 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R154 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010011010:
				begin
					Load_R155 = flag;
					Clear_R155 = clear;
					ClearF_R155 = clearFlag;
				end
				32'b00000000000000000000000010011011:
				begin
					Load_R156 = flag;
					Clear_R156 = clear;
					ClearF_R156 = clearFlag;
				end
				32'b00000000000000000000000010011100:
				begin
					Load_R157 = flag;
					Clear_R157 = clear;
					ClearF_R157 = clearFlag;
				end
				32'b00000000000000000000000010011101:
				begin
					Load_R158 = flag;
					Clear_R158 = clear;
					ClearF_R158 = clearFlag;
				end
				32'b00000000000000000000000010011110:
				begin
					Load_R159 = flag;
					Clear_R159 = clear;
					ClearF_R159 = clearFlag;
				end
				32'b00000000000000000000000010011111:
				begin
					Load_R160 = flag;
					Clear_R160 = clear;
					ClearF_R160 = clearFlag;
				end
				32'b00000000000000000000000010100000:
				begin
					Load_R161 = flag;
					Clear_R161 = clear;
					ClearF_R161 = clearFlag;
				end
				32'b00000000000000000000000010100001:
				begin
					Load_R162 = flag;
					Clear_R162 = clear;
					ClearF_R162 = clearFlag;
				end
				32'b00000000000000000000000010100010:
				begin
					Load_R163 = flag;
					Clear_R163 = clear;
					ClearF_R163 = clearFlag;
				end
				32'b00000000000000000000000010100011:
				begin
					Load_R164 = flag;
					Clear_R164 = clear;
					ClearF_R164 = clearFlag;
				end
				32'b00000000000000000000000010100100:
				begin
					Load_R165 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R165 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010100101:
				begin
					Load_R166 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R166 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010100110:
				begin
					Load_R167 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R167 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				32'b00000000000000000000000010100111:
				begin
					Load_R168 = flag;
					Clear_R70 = clear;
					Clear_R84 = clear;
					Clear_R97 = clear;
					Clear_R98 = clear;
					Clear_R111 = clear;
					Clear_R112 = clear;
					Clear_R125 = clear;
					Clear_R126 = clear;
					Clear_R137 = clear;
					Clear_R138 = clear;
					Clear_R139 = clear;
					Clear_R140 = clear;
					Clear_R151 = clear;
					Clear_R152 = clear;
					Clear_R153 = clear;
					Clear_R154 = clear;
					Clear_R165 = clear;
					Clear_R166 = clear;
					Clear_R167 = clear;
					Clear_R168 = clear;
					ClearF_R168 = clearFlag;
					//clear number
					Clear_R56 = clear;
					Clear_R55 = clear;
					Clear_R69 = clear;
					Clear_R83 = clear;
					Clear_R82 = clear;
					Clear_R96 = clear;
					Clear_R110 = clear;
					Clear_R124 = clear;
					Clear_R123 = clear;
					Clear_R122 = clear;
					Clear_R136 = clear;
					Clear_R150 = clear;
					Clear_R164 = clear;
				end
				default;
			endcase
		end
	
	
	
	
	//row1
	 reg_8 reg1(.*, .END(deadd), .clearFlag(ClearF_R1), .dead(Dead_R1), .Clk(frame_clk), .clear(Clear_R1), .Load(Load_R1), .D(8'b00000001), .Data_Out(R1_Out));
	 reg_8 reg2(.*, .END(deadd),.clearFlag(ClearF_R2),.dead(Dead_R2), .Clk(frame_clk), .clear(Clear_R2),.Load(Load_R2), .D(8'b00000001), .Data_Out(R2_Out));
	 reg_8 reg3(.*, .END(deadd),.clearFlag(ClearF_R3),.dead(Dead_R3), .Clk(frame_clk), .clear(Clear_R3),.Load(Load_R3), .D(8'b00000001), .Data_Out(R3_Out));
	 reg_8 reg4(.*, .END(deadd),.clearFlag(ClearF_R4),.dead(Dead_R4), .Clk(frame_clk), .clear(Clear_R4),.Load(Load_R4), .D(8'b00000101), .Data_Out(R4_Out));
	 reg_8 reg5(.*, .END(deadd),.clearFlag(ClearF_R5),.dead(Dead_R5), .Clk(frame_clk), .clear(Clear_R5),.Load(Load_R5), .D(8'b00000101), .Data_Out(R5_Out));
	 reg_8 reg6(.*, .END(deadd),.clearFlag(ClearF_R6),.dead(Dead_R6), .Clk(frame_clk), .clear(Clear_R6),.Load(Load_R6), .D(8'b00001001), .Data_Out(R6_Out));
	 reg_8 reg7(.*, .END(deadd),.clearFlag(ClearF_R7),.dead(Dead_R7), .Clk(frame_clk), .clear(Clear_R7),.Load(Load_R7), .D(8'b00000101), .Data_Out(R7_Out));
	 reg_8 reg8(.*, .END(deadd),.clearFlag(ClearF_R8),.dead(Dead_R8), .Clk(frame_clk), .clear(Clear_R8),.Load(Load_R8), .D(8'b00000101), .Data_Out(R8_Out));
	 reg_8 reg9(.*, .END(deadd),.clearFlag(ClearF_R9),.dead(Dead_R9), .Clk(frame_clk), .clear(Clear_R9),.Load(Load_R9), .D(8'b00000001), .Data_Out(R9_Out));
	 reg_8 reg10(.*, .END(deadd),.clearFlag(ClearF_R10),.dead(Dead_R10), .Clk(frame_clk), .clear(Clear_R10),.Load(Load_R10), .D(8'b00000001), .Data_Out(R10_Out));
	 reg_8 reg11(.*, .END(deadd),.clearFlag(ClearF_R11),.dead(Dead_R11), .Clk(frame_clk), .clear(Clear_R11),.Load(Load_R11), .D(8'b00000101), .Data_Out(R11_Out));
	 reg_8 reg12(.*, .END(deadd),.clearFlag(ClearF_R12),.dead(Dead_R12), .Clk(frame_clk), .clear(Clear_R12),.Load(Load_R12), .D(8'b00000101), .Data_Out(R12_Out));
	 reg_8 reg13(.*, .END(deadd),.clearFlag(ClearF_R13),.dead(Dead_R13), .Clk(frame_clk), .clear(Clear_R13),.Load(Load_R13), .D(8'b00000101), .Data_Out(R13_Out));
	 reg_8 reg14(.*, .END(deadd),.clearFlag(ClearF_R14),.dead(Dead_R14), .Clk(frame_clk), .clear(Clear_R14),.Load(Load_R14), .D(8'b00000001), .Data_Out(R14_Out));
	 
	 //row2
	 reg_8 reg15(.*, .END(deadd),.clearFlag(ClearF_R15),.dead(Dead_R15),.Clk(frame_clk), .clear(Clear_R15),.Load(Load_R15), .D(8'b00000001), .Data_Out(R15_Out));
	 reg_8 reg16(.*, .END(deadd),.clearFlag(ClearF_R16),.dead(Dead_R16),.Clk(frame_clk), .clear(Clear_R16),.Load(Load_R16), .D(8'b00000001), .Data_Out(R16_Out));
	 reg_8 reg17(.*, .END(deadd),.clearFlag(ClearF_R17),.dead(Dead_R17),.Clk(frame_clk), .clear(Clear_R17),.Load(Load_R17), .D(8'b00000001), .Data_Out(R17_Out));
	 reg_8 reg18(.*, .END(deadd),.clearFlag(ClearF_R18),.dead(Dead_R18),.Clk(frame_clk), .clear(Clear_R18),.Load(Load_R18), .D(8'b00001001), .Data_Out(R18_Out));
	 reg_8 reg19(.*, .END(deadd),.clearFlag(ClearF_R19),.dead(Dead_R19),.Clk(frame_clk), .clear(Clear_R19),.Load(Load_R19), .D(8'b00100001), .Data_Out(R19_Out));
	 reg_8 reg20(.*, .END(deadd),.clearFlag(ClearF_R20),.dead(Dead_R20),.Clk(frame_clk), .clear(Clear_R20),.Load(Load_R20), .D(8'b00010001), .Data_Out(R20_Out));
	 reg_8 reg21(.*, .END(deadd),.clearFlag(ClearF_R21),.dead(Dead_R21),.Clk(frame_clk), .clear(Clear_R21),.Load(Load_R21), .D(8'b00100001), .Data_Out(R21_Out));
	 reg_8 reg22(.*, .END(deadd),.clearFlag(ClearF_R22),.dead(Dead_R22),.Clk(frame_clk), .clear(Clear_R22),.Load(Load_R22), .D(8'b00001001), .Data_Out(R22_Out));
	 reg_8 reg23(.*, .END(deadd),.clearFlag(ClearF_R23),.dead(Dead_R23),.Clk(frame_clk), .clear(Clear_R23),.Load(Load_R23), .D(8'b00000001), .Data_Out(R23_Out));
	 reg_8 reg24(.*, .END(deadd),.clearFlag(ClearF_R24),.dead(Dead_R24),.Clk(frame_clk), .clear(Clear_R24),.Load(Load_R24), .D(8'b00000001), .Data_Out(R24_Out));
	 reg_8 reg25(.*, .END(deadd),.clearFlag(ClearF_R25),.dead(Dead_R25),.Clk(frame_clk), .clear(Clear_R25),.Load(Load_R25), .D(8'b00000101), .Data_Out(R25_Out));
	 reg_8 reg26(.*, .END(deadd),.clearFlag(ClearF_R26),.dead(Dead_R26),.Clk(frame_clk), .clear(Clear_R26),.Load(Load_R26), .D(8'b00100001), .Data_Out(R26_Out));
	 reg_8 reg27(.*, .END(deadd),.clearFlag(ClearF_R27),.dead(Dead_R27),.Clk(frame_clk), .clear(Clear_R27),.Load(Load_R27), .D(8'b00001001), .Data_Out(R27_Out));
	 reg_8 reg28(.*, .END(deadd),.clearFlag(ClearF_R28),.dead(Dead_R28),.Clk(frame_clk), .clear(Clear_R28),.Load(Load_R28), .D(8'b00000101), .Data_Out(R28_Out));
	 
	 //row3
	 reg_8 reg29(.*, .END(deadd),.clearFlag(ClearF_R29),.dead(Dead_R29),.Clk(frame_clk), .clear(Clear_R29),.Load(Load_R29), .D(8'b00000101), .Data_Out(R29_Out));
	 reg_8 reg30(.*, .END(deadd),.clearFlag(ClearF_R30),.dead(Dead_R30),.Clk(frame_clk), .clear(Clear_R30),.Load(Load_R30), .D(8'b00000101), .Data_Out(R30_Out));
	 reg_8 reg31(.*, .END(deadd),.clearFlag(ClearF_R31),.dead(Dead_R31),.Clk(frame_clk), .clear(Clear_R31),.Load(Load_R31), .D(8'b00000101), .Data_Out(R31_Out));
	 reg_8 reg32(.*, .END(deadd),.clearFlag(ClearF_R32),.dead(Dead_R32),.Clk(frame_clk), .clear(Clear_R32),.Load(Load_R32), .D(8'b00010001), .Data_Out(R32_Out));
	 reg_8 reg33(.*, .END(deadd),.clearFlag(ClearF_R33),.dead(Dead_R33),.Clk(frame_clk), .clear(Clear_R33),.Load(Load_R33), .D(8'b00100001), .Data_Out(R33_Out));
	 reg_8 reg34(.*, .END(deadd),.clearFlag(ClearF_R34),.dead(Dead_R34),.Clk(frame_clk), .clear(Clear_R34),.Load(Load_R34), .D(8'b00010101), .Data_Out(R34_Out));
	 reg_8 reg35(.*, .END(deadd),.clearFlag(ClearF_R35),.dead(Dead_R35),.Clk(frame_clk), .clear(Clear_R35),.Load(Load_R35), .D(8'b00100001), .Data_Out(R35_Out));
	 reg_8 reg36(.*, .END(deadd),.clearFlag(ClearF_R36),.dead(Dead_R36),.Clk(frame_clk), .clear(Clear_R36),.Load(Load_R36), .D(8'b00001101), .Data_Out(R36_Out));
	 reg_8 reg37(.*, .END(deadd),.clearFlag(ClearF_R37),.dead(Dead_R37),.Clk(frame_clk), .clear(Clear_R37),.Load(Load_R37), .D(8'b00000101), .Data_Out(R37_Out));
	 reg_8 reg38(.*, .END(deadd),.clearFlag(ClearF_R38),.dead(Dead_R38),.Clk(frame_clk), .clear(Clear_R38),.Load(Load_R38), .D(8'b00000001), .Data_Out(R38_Out));
	 reg_8 reg39(.*, .END(deadd),.clearFlag(ClearF_R39),.dead(Dead_R39),.Clk(frame_clk), .clear(Clear_R39),.Load(Load_R39), .D(8'b00000101), .Data_Out(R39_Out));
	 reg_8 reg40(.*, .END(deadd),.clearFlag(ClearF_R40),.dead(Dead_R40),.Clk(frame_clk), .clear(Clear_R40),.Load(Load_R40), .D(8'b00000101), .Data_Out(R40_Out));
	 reg_8 reg41(.*, .END(deadd),.clearFlag(ClearF_R41),.dead(Dead_R41),.Clk(frame_clk), .clear(Clear_R41),.Load(Load_R41), .D(8'b00001001), .Data_Out(R41_Out));
	 reg_8 reg42(.*, .END(deadd),.clearFlag(ClearF_R42),.dead(Dead_R42),.Clk(frame_clk), .clear(Clear_R42),.Load(Load_R42), .D(8'b00100001), .Data_Out(R42_Out));
	 
	 //row4
	 reg_8 reg43(.*, .END(deadd),.clearFlag(ClearF_R43),.dead(Dead_R43),.Clk(frame_clk), .clear(Clear_R43),.Load(Load_R43), .D(8'b00100001), .Data_Out(R43_Out));
	 reg_8 reg44(.*, .END(deadd),.clearFlag(ClearF_R44),.dead(Dead_R44),.Clk(frame_clk), .clear(Clear_R44),.Load(Load_R44), .D(8'b00000101), .Data_Out(R44_Out));
	 reg_8 reg45(.*, .END(deadd),.clearFlag(ClearF_R45),.dead(Dead_R45),.Clk(frame_clk), .clear(Clear_R45),.Load(Load_R45), .D(8'b00000101), .Data_Out(R45_Out));
	 reg_8 reg46(.*, .END(deadd),.clearFlag(ClearF_R46),.dead(Dead_R46),.Clk(frame_clk), .clear(Clear_R46),.Load(Load_R46), .D(8'b00100001), .Data_Out(R46_Out));
	 reg_8 reg47(.*, .END(deadd),.clearFlag(ClearF_R47),.dead(Dead_R47),.Clk(frame_clk), .clear(Clear_R47),.Load(Load_R47), .D(8'b00100001), .Data_Out(R47_Out));
	 reg_8 reg48(.*, .END(deadd),.clearFlag(ClearF_R48),.dead(Dead_R48),.Clk(frame_clk), .clear(Clear_R48),.Load(Load_R48), .D(8'b00010001), .Data_Out(R48_Out));
	 reg_8 reg49(.*, .END(deadd),.clearFlag(ClearF_R49),.dead(Dead_R49),.Clk(frame_clk), .clear(Clear_R49),.Load(Load_R49), .D(8'b00001101), .Data_Out(R49_Out));
	 reg_8 reg50(.*, .END(deadd),.clearFlag(ClearF_R50),.dead(Dead_R50),.Clk(frame_clk), .clear(Clear_R50),.Load(Load_R50), .D(8'b00100001), .Data_Out(R50_Out));
	 reg_8 reg51(.*, .END(deadd),.clearFlag(ClearF_R51),.dead(Dead_R51),.Clk(frame_clk), .clear(Clear_R51),.Load(Load_R51), .D(8'b00000101), .Data_Out(R51_Out));
	 reg_8 reg52(.*, .END(deadd),.clearFlag(ClearF_R52),.dead(Dead_R52),.Clk(frame_clk), .clear(Clear_R52),.Load(Load_R52), .D(8'b00000001), .Data_Out(R52_Out));
	 reg_8 reg53(.*, .END(deadd),.clearFlag(ClearF_R53),.dead(Dead_R53),.Clk(frame_clk), .clear(Clear_R53),.Load(Load_R53), .D(8'b00000101), .Data_Out(R53_Out));
	 reg_8 reg54(.*, .END(deadd),.clearFlag(ClearF_R54),.dead(Dead_R54),.Clk(frame_clk), .clear(Clear_R54),.Load(Load_R54), .D(8'b00000101), .Data_Out(R54_Out));
	 reg_8 reg55(.*, .END(deadd),.clearFlag(ClearF_R55),.dead(Dead_R55),.Clk(frame_clk), .clear(Clear_R55),.Load(Load_R55), .D(8'b00001001), .Data_Out(R55_Out));
	 reg_8 reg56(.*, .END(deadd),.clearFlag(ClearF_R56),.dead(Dead_R56),.Clk(frame_clk), .clear(Clear_R56),.Load(Load_R56), .D(8'b00000101), .Data_Out(R56_Out));
	
	 //row5
	 reg_8 reg57(.*, .END(deadd),.clearFlag(ClearF_R57),.dead(Dead_R57),.Clk(frame_clk), .clear(Clear_R57),.Load(Load_R57), .D(8'b00000101), .Data_Out(R57_Out));
	 reg_8 reg58(.*, .END(deadd),.clearFlag(ClearF_R58),.dead(Dead_R58),.Clk(frame_clk), .clear(Clear_R58),.Load(Load_R58), .D(8'b00000101), .Data_Out(R58_Out));
	 reg_8 reg59(.*, .END(deadd),.clearFlag(ClearF_R59),.dead(Dead_R59),.Clk(frame_clk), .clear(Clear_R59),.Load(Load_R59), .D(8'b00001001), .Data_Out(R59_Out));
	 reg_8 reg60(.*, .END(deadd),.clearFlag(ClearF_R60),.dead(Dead_R60),.Clk(frame_clk), .clear(Clear_R60),.Load(Load_R60), .D(8'b00001101), .Data_Out(R60_Out));
	 reg_8 reg61(.*, .END(deadd),.clearFlag(ClearF_R61),.dead(Dead_R61),.Clk(frame_clk), .clear(Clear_R61),.Load(Load_R61), .D(8'b00010001), .Data_Out(R61_Out));
	 reg_8 reg62(.*, .END(deadd),.clearFlag(ClearF_R62),.dead(Dead_R62),.Clk(frame_clk), .clear(Clear_R62),.Load(Load_R62), .D(8'b00001101), .Data_Out(R62_Out));
	 reg_8 reg63(.*, .END(deadd),.clearFlag(ClearF_R63),.dead(Dead_R63),.Clk(frame_clk), .clear(Clear_R63),.Load(Load_R63), .D(8'b00100001), .Data_Out(R63_Out));
	 reg_8 reg64(.*, .END(deadd),.clearFlag(ClearF_R64),.dead(Dead_R64),.Clk(frame_clk), .clear(Clear_R64),.Load(Load_R64), .D(8'b00001001), .Data_Out(R64_Out));
	 reg_8 reg65(.*, .END(deadd),.clearFlag(ClearF_R65),.dead(Dead_R65),.Clk(frame_clk), .clear(Clear_R65),.Load(Load_R65), .D(8'b00000101), .Data_Out(R65_Out));
	 reg_8 reg66(.*, .END(deadd),.clearFlag(ClearF_R66),.dead(Dead_R66),.Clk(frame_clk), .clear(Clear_R66),.Load(Load_R66), .D(8'b00000001), .Data_Out(R66_Out));
	 reg_8 reg67(.*, .END(deadd),.clearFlag(ClearF_R67),.dead(Dead_R67),.Clk(frame_clk), .clear(Clear_R67),.Load(Load_R67), .D(8'b00000101), .Data_Out(R67_Out));
	 reg_8 reg68(.*, .END(deadd),.clearFlag(ClearF_R68),.dead(Dead_R68),.Clk(frame_clk), .clear(Clear_R68),.Load(Load_R68), .D(8'b00100001), .Data_Out(R68_Out));
	 reg_8 reg69(.*, .END(deadd),.clearFlag(ClearF_R69),.dead(Dead_R69),.Clk(frame_clk), .clear(Clear_R69),.Load(Load_R69), .D(8'b00000101), .Data_Out(R69_Out));
	 reg_8 reg70(.*, .END(deadd),.clearFlag(ClearF_R70),.dead(Dead_R70),.Clk(frame_clk), .clear(Clear_R70),.Load(Load_R70), .D(8'b00000001), .Data_Out(R70_Out));
	 
	 
	 //row6
	 reg_8 reg71(.*, .END(deadd),.clearFlag(ClearF_R71),.dead(Dead_R71),.Clk(frame_clk), .clear(Clear_R71),.Load(Load_R71), .D(8'b00000001), .Data_Out(R71_Out));
	 reg_8 reg72(.*, .END(deadd),.clearFlag(ClearF_R72),.dead(Dead_R72),.Clk(frame_clk), .clear(Clear_R72),.Load(Load_R72), .D(8'b00000001), .Data_Out(R72_Out));
	 reg_8 reg73(.*, .END(deadd),.clearFlag(ClearF_R72),.dead(Dead_R73),.Clk(frame_clk), .clear(Clear_R73),.Load(Load_R73), .D(8'b00000101), .Data_Out(R73_Out));
	 reg_8 reg74(.*, .END(deadd),.clearFlag(ClearF_R74),.dead(Dead_R74),.Clk(frame_clk), .clear(Clear_R74),.Load(Load_R74), .D(8'b00100001), .Data_Out(R74_Out));
	 reg_8 reg75(.*, .END(deadd),.clearFlag(ClearF_R75),.dead(Dead_R75),.Clk(frame_clk), .clear(Clear_R75),.Load(Load_R75), .D(8'b00001101), .Data_Out(R75_Out));
	 reg_8 reg76(.*, .END(deadd),.clearFlag(ClearF_R76),.dead(Dead_R76),.Clk(frame_clk), .clear(Clear_R76),.Load(Load_R76), .D(8'b00100001), .Data_Out(R76_Out));
	 reg_8 reg77(.*, .END(deadd),.clearFlag(ClearF_R77),.dead(Dead_R77),.Clk(frame_clk), .clear(Clear_R77),.Load(Load_R77), .D(8'b00001101), .Data_Out(R77_Out));
	 reg_8 reg78(.*, .END(deadd),.clearFlag(ClearF_R78),.dead(Dead_R78),.Clk(frame_clk), .clear(Clear_R78),.Load(Load_R78), .D(8'b00000101), .Data_Out(R78_Out));
	 reg_8 reg79(.*, .END(deadd),.clearFlag(ClearF_R79),.dead(Dead_R79),.Clk(frame_clk), .clear(Clear_R79),.Load(Load_R79), .D(8'b00000001), .Data_Out(R79_Out));
	 reg_8 reg80(.*, .END(deadd),.clearFlag(ClearF_R80),.dead(Dead_R80),.Clk(frame_clk), .clear(Clear_R80),.Load(Load_R80), .D(8'b00000001), .Data_Out(R80_Out));
	 reg_8 reg81(.*, .END(deadd),.clearFlag(ClearF_R81),.dead(Dead_R81),.Clk(frame_clk), .clear(Clear_R81),.Load(Load_R81), .D(8'b00000101), .Data_Out(R81_Out));
	 reg_8 reg82(.*, .END(deadd),.clearFlag(ClearF_R82),.dead(Dead_R82),.Clk(frame_clk), .clear(Clear_R82),.Load(Load_R82), .D(8'b00000101), .Data_Out(R82_Out));
	 reg_8 reg83(.*, .END(deadd),.clearFlag(ClearF_R83),.dead(Dead_R83),.Clk(frame_clk), .clear(Clear_R83),.Load(Load_R83), .D(8'b00000101), .Data_Out(R83_Out));
	 reg_8 reg84(.*, .END(deadd),.clearFlag(ClearF_R84),.dead(Dead_R84),.Clk(frame_clk), .clear(Clear_R84),.Load(Load_R84), .D(8'b00000001), .Data_Out(R84_Out));
	 
	 
	 //row7
	 reg_8 reg85(.*, .END(deadd),.clearFlag(ClearF_R85),.dead(Dead_R85),.Clk(frame_clk), .clear(Clear_R85),.Load(Load_R85), .D(8'b00000001), .Data_Out(R85_Out));
	 reg_8 reg86(.*, .END(deadd),.clearFlag(ClearF_R86),.dead(Dead_R86),.Clk(frame_clk), .clear(Clear_R86),.Load(Load_R86), .D(8'b00000001), .Data_Out(R86_Out));
	 reg_8 reg87(.*, .END(deadd),.clearFlag(ClearF_R87),.dead(Dead_R87),.Clk(frame_clk), .clear(Clear_R87),.Load(Load_R87), .D(8'b00000101), .Data_Out(R87_Out));
	 reg_8 reg88(.*, .END(deadd),.clearFlag(ClearF_R88),.dead(Dead_R88),.Clk(frame_clk), .clear(Clear_R88),.Load(Load_R88), .D(8'b00000101), .Data_Out(R88_Out));
	 reg_8 reg89(.*, .END(deadd),.clearFlag(ClearF_R89),.dead(Dead_R89),.Clk(frame_clk), .clear(Clear_R89),.Load(Load_R89), .D(8'b00001101), .Data_Out(R89_Out));
	 reg_8 reg90(.*, .END(deadd),.clearFlag(ClearF_R90),.dead(Dead_R90),.Clk(frame_clk), .clear(Clear_R90),.Load(Load_R90), .D(8'b00100001), .Data_Out(R90_Out));
	 reg_8 reg91(.*, .END(deadd),.clearFlag(ClearF_R91),.dead(Dead_R91),.Clk(frame_clk), .clear(Clear_R91),.Load(Load_R91), .D(8'b00001001), .Data_Out(R91_Out));
	 reg_8 reg92(.*, .END(deadd),.clearFlag(ClearF_R92),.dead(Dead_R92),.Clk(frame_clk), .clear(Clear_R92),.Load(Load_R92), .D(8'b00000001), .Data_Out(R92_Out));
	 reg_8 reg93(.*, .END(deadd),.clearFlag(ClearF_R93),.dead(Dead_R93),.Clk(frame_clk), .clear(Clear_R93),.Load(Load_R93), .D(8'b00000001), .Data_Out(R93_Out));
	 reg_8 reg94(.*, .END(deadd),.clearFlag(ClearF_R94),.dead(Dead_R94),.Clk(frame_clk), .clear(Clear_R94),.Load(Load_R94), .D(8'b00000101), .Data_Out(R94_Out));
	 reg_8 reg95(.*, .END(deadd),.clearFlag(ClearF_R95),.dead(Dead_R95),.Clk(frame_clk), .clear(Clear_R95),.Load(Load_R95), .D(8'b00000101), .Data_Out(R95_Out));
	 reg_8 reg96(.*, .END(deadd),.clearFlag(ClearF_R96),.dead(Dead_R96),.Clk(frame_clk), .clear(Clear_R96),.Load(Load_R96), .D(8'b00000101), .Data_Out(R96_Out));
	 reg_8 reg97(.*, .END(deadd),.clearFlag(ClearF_R97),.dead(Dead_R97),.Clk(frame_clk), .clear(Clear_R97),.Load(Load_R97), .D(8'b00000001), .Data_Out(R97_Out));
	 reg_8 reg98(.*, .END(deadd),.clearFlag(ClearF_R98),.dead(Dead_R98),.Clk(frame_clk), .clear(Clear_R98),.Load(Load_R98), .D(8'b00000001), .Data_Out(R98_Out));
	 
	 
	 //row8
	 reg_8 reg99(.*, .END(deadd),.clearFlag(ClearF_R99),.dead(Dead_R99),.Clk(frame_clk), .clear(Clear_R99),.Load(Load_R99), .D(8'b00000001), .Data_Out(R99_Out));
	 reg_8 reg100(.*, .END(deadd),.clearFlag(ClearF_R100),.dead(Dead_R100),.Clk(frame_clk), .clear(Clear_R100),.Load(Load_R100), .D(8'b00000101), .Data_Out(R100_Out));
	 reg_8 reg101(.*, .END(deadd),.clearFlag(ClearF_R101),.dead(Dead_R101),.Clk(frame_clk), .clear(Clear_R101),.Load(Load_R101), .D(8'b00000101), .Data_Out(R101_Out));
	 reg_8 reg102(.*, .END(deadd),.clearFlag(ClearF_R102),.dead(Dead_R102),.Clk(frame_clk), .clear(Clear_R102),.Load(Load_R102), .D(8'b00000101), .Data_Out(R102_Out));
	 reg_8 reg103(.*, .END(deadd),.clearFlag(ClearF_R103),.dead(Dead_R103),.Clk(frame_clk), .clear(Clear_R103),.Load(Load_R103), .D(8'b00001001), .Data_Out(R103_Out));
	 reg_8 reg104(.*, .END(deadd),.clearFlag(ClearF_R104),.dead(Dead_R104),.Clk(frame_clk), .clear(Clear_R104),.Load(Load_R104), .D(8'b00001001), .Data_Out(R104_Out));
	 reg_8 reg105(.*, .END(deadd),.clearFlag(ClearF_R105),.dead(Dead_R105),.Clk(frame_clk), .clear(Clear_R105),.Load(Load_R105), .D(8'b00001001), .Data_Out(R105_Out));
	 reg_8 reg106(.*, .END(deadd),.clearFlag(ClearF_R106),.dead(Dead_R106),.Clk(frame_clk), .clear(Clear_R106),.Load(Load_R106), .D(8'b00000101), .Data_Out(R106_Out));
	 reg_8 reg107(.*, .END(deadd),.clearFlag(ClearF_R107),.dead(Dead_R107),.Clk(frame_clk), .clear(Clear_R107),.Load(Load_R107), .D(8'b00000101), .Data_Out(R107_Out));
	 reg_8 reg108(.*, .END(deadd),.clearFlag(ClearF_R108),.dead(Dead_R108),.Clk(frame_clk), .clear(Clear_R108),.Load(Load_R108), .D(8'b00001001), .Data_Out(R108_Out));
	 reg_8 reg109(.*, .END(deadd),.clearFlag(ClearF_R109),.dead(Dead_R109),.Clk(frame_clk), .clear(Clear_R109),.Load(Load_R109), .D(8'b00100001), .Data_Out(R109_Out));
	 reg_8 reg110(.*, .END(deadd),.clearFlag(ClearF_R110),.dead(Dead_R110),.Clk(frame_clk), .clear(Clear_R110),.Load(Load_R110), .D(8'b00000101), .Data_Out(R110_Out));
	 reg_8 reg111(.*, .END(deadd),.clearFlag(ClearF_R111),.dead(Dead_R111),.Clk(frame_clk), .clear(Clear_R111),.Load(Load_R111), .D(8'b00000001), .Data_Out(R111_Out));
	 reg_8 reg112(.*, .END(deadd),.clearFlag(ClearF_R112),.dead(Dead_R112),.Clk(frame_clk), .clear(Clear_R112),.Load(Load_R112), .D(8'b00000001), .Data_Out(R112_Out));
	 
	 
	 //row9
	 reg_8 reg113(.*, .END(deadd),.clearFlag(ClearF_R113),.dead(Dead_R113),.Clk(frame_clk), .clear(Clear_R113),.Load(Load_R113), .D(8'b00000001), .Data_Out(R113_Out));
	 reg_8 reg114(.*, .END(deadd),.clearFlag(ClearF_R114),.dead(Dead_R114),.Clk(frame_clk), .clear(Clear_R114),.Load(Load_R114), .D(8'b00000101), .Data_Out(R114_Out));
	 reg_8 reg115(.*, .END(deadd),.clearFlag(ClearF_R115),.dead(Dead_R115),.Clk(frame_clk), .clear(Clear_R115),.Load(Load_R115), .D(8'b00100001), .Data_Out(R115_Out));
	 reg_8 reg116(.*, .END(deadd),.clearFlag(ClearF_R116),.dead(Dead_R116),.Clk(frame_clk), .clear(Clear_R116),.Load(Load_R116), .D(8'b00001001), .Data_Out(R116_Out));
	 reg_8 reg117(.*, .END(deadd),.clearFlag(ClearF_R117),.dead(Dead_R117),.Clk(frame_clk), .clear(Clear_R117),.Load(Load_R117), .D(8'b00001001), .Data_Out(R117_Out));
	 reg_8 reg118(.*, .END(deadd),.clearFlag(ClearF_R118),.dead(Dead_R118),.Clk(frame_clk), .clear(Clear_R118),.Load(Load_R118), .D(8'b00100001), .Data_Out(R118_Out));
	 reg_8 reg119(.*, .END(deadd),.clearFlag(ClearF_R119),.dead(Dead_R119),.Clk(frame_clk), .clear(Clear_R119),.Load(Load_R119), .D(8'b00000101), .Data_Out(R119_Out));
	 reg_8 reg120(.*, .END(deadd),.clearFlag(ClearF_R120),.dead(Dead_R120),.Clk(frame_clk), .clear(Clear_R120),.Load(Load_R120), .D(8'b00000101), .Data_Out(R120_Out));
	 reg_8 reg121(.*, .END(deadd),.clearFlag(ClearF_R121),.dead(Dead_R121),.Clk(frame_clk), .clear(Clear_R121),.Load(Load_R121), .D(8'b00100001), .Data_Out(R121_Out));
	 reg_8 reg122(.*, .END(deadd),.clearFlag(ClearF_R122),.dead(Dead_R122),.Clk(frame_clk), .clear(Clear_R122),.Load(Load_R122), .D(8'b00001001), .Data_Out(R122_Out));
	 reg_8 reg123(.*, .END(deadd),.clearFlag(ClearF_R123),.dead(Dead_R123),.Clk(frame_clk), .clear(Clear_R123),.Load(Load_R123), .D(8'b00000101), .Data_Out(R123_Out));
	 reg_8 reg124(.*, .END(deadd),.clearFlag(ClearF_R124),.dead(Dead_R124),.Clk(frame_clk), .clear(Clear_R124),.Load(Load_R124), .D(8'b00000101), .Data_Out(R124_Out));
	 reg_8 reg125(.*, .END(deadd),.clearFlag(ClearF_R125),.dead(Dead_R125),.Clk(frame_clk), .clear(Clear_R125),.Load(Load_R125), .D(8'b00000001), .Data_Out(R125_Out));
	 reg_8 reg126(.*, .END(deadd),.clearFlag(ClearF_R126),.dead(Dead_R126),.Clk(frame_clk), .clear(Clear_R126),.Load(Load_R126), .D(8'b00000001), .Data_Out(R126_Out));
	 
	 
	 ////row10'
	 reg_8 reg127(.*, .END(deadd),.clearFlag(ClearF_R127),.dead(Dead_R127),.Clk(frame_clk), .clear(Clear_R127),.Load(Load_R127), .D(8'b00000101), .Data_Out(R127_Out));
	 reg_8 reg128(.*, .END(deadd),.clearFlag(ClearF_R128),.dead(Dead_R128),.Clk(frame_clk), .clear(Clear_R128),.Load(Load_R128), .D(8'b00001001), .Data_Out(R128_Out));
	 reg_8 reg129(.*, .END(deadd),.clearFlag(ClearF_R129),.dead(Dead_R129),.Clk(frame_clk), .clear(Clear_R129),.Load(Load_R129), .D(8'b00000101), .Data_Out(R129_Out));
	 reg_8 reg130(.*, .END(deadd),.clearFlag(ClearF_R130),.dead(Dead_R130),.Clk(frame_clk), .clear(Clear_R130),.Load(Load_R130), .D(8'b00001001), .Data_Out(R130_Out));
	 reg_8 reg131(.*, .END(deadd),.clearFlag(ClearF_R131),.dead(Dead_R131),.Clk(frame_clk), .clear(Clear_R131),.Load(Load_R131), .D(8'b00100001), .Data_Out(R131_Out));
	 reg_8 reg132(.*, .END(deadd),.clearFlag(ClearF_R132),.dead(Dead_R132),.Clk(frame_clk), .clear(Clear_R132),.Load(Load_R132), .D(8'b00001001), .Data_Out(R132_Out));
	 reg_8 reg133(.*, .END(deadd),.clearFlag(ClearF_R133),.dead(Dead_R133),.Clk(frame_clk), .clear(Clear_R133),.Load(Load_R133), .D(8'b00000101), .Data_Out(R133_Out));
	 reg_8 reg134(.*, .END(deadd),.clearFlag(ClearF_R134),.dead(Dead_R134),.Clk(frame_clk), .clear(Clear_R134),.Load(Load_R134), .D(8'b00000101), .Data_Out(R134_Out));
	 reg_8 reg135(.*, .END(deadd),.clearFlag(ClearF_R135),.dead(Dead_R135),.Clk(frame_clk), .clear(Clear_R135),.Load(Load_R135), .D(8'b00000101), .Data_Out(R135_Out));
	 reg_8 reg136(.*, .END(deadd),.clearFlag(ClearF_R136),.dead(Dead_R136),.Clk(frame_clk), .clear(Clear_R136),.Load(Load_R136), .D(8'b00000101), .Data_Out(R136_Out));
	 reg_8 reg137(.*, .END(deadd),.clearFlag(ClearF_R137),.dead(Dead_R137),.Clk(frame_clk), .clear(Clear_R137),.Load(Load_R137), .D(8'b00000001), .Data_Out(R137_Out));
	 reg_8 reg138(.*, .END(deadd),.clearFlag(ClearF_R138),.dead(Dead_R138),.Clk(frame_clk), .clear(Clear_R138),.Load(Load_R138), .D(8'b00000001), .Data_Out(R138_Out));
	 reg_8 reg139(.*, .END(deadd),.clearFlag(ClearF_R139),.dead(Dead_R139),.Clk(frame_clk), .clear(Clear_R139),.Load(Load_R139), .D(8'b00000001), .Data_Out(R139_Out));
	 reg_8 reg140(.*, .END(deadd),.clearFlag(ClearF_R140),.dead(Dead_R140),.Clk(frame_clk), .clear(Clear_R140),.Load(Load_R140), .D(8'b00000001), .Data_Out(R140_Out));
	 
	 
	 //row11
	 reg_8 reg141(.*, .END(deadd),.clearFlag(ClearF_R141),.dead(Dead_R141),.Clk(frame_clk), .clear(Clear_R141),.Load(Load_R141), .D(8'b00100001), .Data_Out(R141_Out));
	 reg_8 reg142(.*, .END(deadd),.clearFlag(ClearF_R142),.dead(Dead_R142),.Clk(frame_clk), .clear(Clear_R142),.Load(Load_R142), .D(8'b00000101), .Data_Out(R142_Out));
	 reg_8 reg143(.*, .END(deadd),.clearFlag(ClearF_R143),.dead(Dead_R143),.Clk(frame_clk), .clear(Clear_R143),.Load(Load_R143), .D(8'b00000101), .Data_Out(R143_Out));
	 reg_8 reg144(.*, .END(deadd),.clearFlag(ClearF_R144),.dead(Dead_R144),.Clk(frame_clk), .clear(Clear_R144),.Load(Load_R144), .D(8'b00001001), .Data_Out(R144_Out));
	 reg_8 reg145(.*, .END(deadd),.clearFlag(ClearF_R145),.dead(Dead_R145),.Clk(frame_clk), .clear(Clear_R145),.Load(Load_R145), .D(8'b00001001), .Data_Out(R145_Out));
	 reg_8 reg146(.*, .END(deadd),.clearFlag(ClearF_R146),.dead(Dead_R146),.Clk(frame_clk), .clear(Clear_R146),.Load(Load_R146), .D(8'b00001001), .Data_Out(R146_Out));
	 reg_8 reg147(.*, .END(deadd),.clearFlag(ClearF_R147),.dead(Dead_R147),.Clk(frame_clk), .clear(Clear_R147),.Load(Load_R147), .D(8'b00001001), .Data_Out(R147_Out));
	 reg_8 reg148(.*, .END(deadd),.clearFlag(ClearF_R148),.dead(Dead_R148),.Clk(frame_clk), .clear(Clear_R148),.Load(Load_R148), .D(8'b00001101), .Data_Out(R148_Out));
	 reg_8 reg149(.*, .END(deadd),.clearFlag(ClearF_R149),.dead(Dead_R149),.Clk(frame_clk), .clear(Clear_R149),.Load(Load_R149), .D(8'b00001001), .Data_Out(R149_Out));
	 reg_8 reg150(.*, .END(deadd),.clearFlag(ClearF_R150),.dead(Dead_R150),.Clk(frame_clk), .clear(Clear_R150),.Load(Load_R150), .D(8'b00000101), .Data_Out(R150_Out));
	 reg_8 reg151(.*, .END(deadd),.clearFlag(ClearF_R151),.dead(Dead_R151),.Clk(frame_clk), .clear(Clear_R151),.Load(Load_R151), .D(8'b00000001), .Data_Out(R151_Out));
	 reg_8 reg152(.*, .END(deadd),.clearFlag(ClearF_R152),.dead(Dead_R152),.Clk(frame_clk), .clear(Clear_R152),.Load(Load_R152), .D(8'b00000001), .Data_Out(R152_Out));
	 reg_8 reg153(.*, .END(deadd),.clearFlag(ClearF_R153),.dead(Dead_R153),.Clk(frame_clk), .clear(Clear_R153),.Load(Load_R153), .D(8'b00000001), .Data_Out(R153_Out));
	 reg_8 reg154(.*, .END(deadd),.clearFlag(ClearF_R154),.dead(Dead_R154),.Clk(frame_clk), .clear(Clear_R154),.Load(Load_R154), .D(8'b00000001), .Data_Out(R154_Out));
	 
	 
	 //row12
	 reg_8 reg155(.*, .END(deadd),.clearFlag(ClearF_R155),.dead(Dead_R155),.Clk(frame_clk), .clear(Clear_R155),.Load(Load_R155), .D(8'b00000101), .Data_Out(R155_Out));
	 reg_8 reg156(.*, .END(deadd),.clearFlag(ClearF_R156),.dead(Dead_R156),.Clk(frame_clk), .clear(Clear_R156),.Load(Load_R156), .D(8'b00000101), .Data_Out(R156_Out));
	 reg_8 reg157(.*, .END(deadd),.clearFlag(ClearF_R157),.dead(Dead_R157),.Clk(frame_clk), .clear(Clear_R157),.Load(Load_R157), .D(8'b00000101), .Data_Out(R157_Out));
	 reg_8 reg158(.*, .END(deadd),.clearFlag(ClearF_R158),.dead(Dead_R158),.Clk(frame_clk), .clear(Clear_R158),.Load(Load_R158), .D(8'b00100001), .Data_Out(R158_Out));
	 reg_8 reg159(.*, .END(deadd),.clearFlag(ClearF_R159),.dead(Dead_R159),.Clk(frame_clk), .clear(Clear_R159),.Load(Load_R159), .D(8'b00000101), .Data_Out(R159_Out));
	 reg_8 reg160(.*, .END(deadd),.clearFlag(ClearF_R160),.dead(Dead_R160),.Clk(frame_clk), .clear(Clear_R160),.Load(Load_R160), .D(8'b00000101), .Data_Out(R160_Out));
	 reg_8 reg161(.*, .END(deadd),.clearFlag(ClearF_R161),.dead(Dead_R161),.Clk(frame_clk), .clear(Clear_R161),.Load(Load_R161), .D(8'b00100001), .Data_Out(R161_Out));
	 reg_8 reg162(.*, .END(deadd),.clearFlag(ClearF_R162),.dead(Dead_R162),.Clk(frame_clk), .clear(Clear_R162),.Load(Load_R162), .D(8'b00100001), .Data_Out(R162_Out));
	 reg_8 reg163(.*, .END(deadd),.clearFlag(ClearF_R163),.dead(Dead_R163),.Clk(frame_clk), .clear(Clear_R163),.Load(Load_R163), .D(8'b00100001), .Data_Out(R163_Out));
	 reg_8 reg164(.*, .END(deadd),.clearFlag(ClearF_R164),.dead(Dead_R164),.Clk(frame_clk), .clear(Clear_R164),.Load(Load_R164), .D(8'b00000101), .Data_Out(R164_Out));
	 reg_8 reg165(.*, .END(deadd),.clearFlag(ClearF_R165),.dead(Dead_R165),.Clk(frame_clk), .clear(Clear_R165),.Load(Load_R165), .D(8'b00000001), .Data_Out(R165_Out));
	 reg_8 reg166(.*, .END(deadd),.clearFlag(ClearF_R166),.dead(Dead_R166),.Clk(frame_clk), .clear(Clear_R166),.Load(Load_R166), .D(8'b00000001), .Data_Out(R166_Out));
	 reg_8 reg167(.*, .END(deadd),.clearFlag(ClearF_R167),.dead(Dead_R167),.Clk(frame_clk), .clear(Clear_R167),.Load(Load_R167), .D(8'b00000001), .Data_Out(R167_Out));
	 reg_8 reg168(.*, .END(deadd),.clearFlag(ClearF_R168),.dead(Dead_R168),.Clk(frame_clk), .clear(Clear_R168),.Load(Load_R168), .D(8'b00000001), .Data_Out(R168_Out));

		assign deadd = Dead_R42 | Dead_R19 | Dead_R21 | Dead_R26 | Dead_R35 | Dead_R33 | Dead_R43 | Dead_R46 | Dead_R47 | Dead_R50 | Dead_R63 | Dead_R68 | Dead_R74 | Dead_R76 | Dead_R90 | Dead_R109 | Dead_R115 | Dead_R118 | Dead_R121 | Dead_R131 | Dead_R141 | Dead_R158 | Dead_R161 | Dead_R162 | Dead_R163;
		assign numFlag = 25 - (R1_Out[6] + R2_Out[6] + R3_Out[6] + R4_Out[6] + R5_Out[6] + R6_Out[6] + R7_Out[6] + R8_Out[6] + R9_Out[6] + R10_Out[6]
							+R11_Out[6] + R12_Out[6] + R13_Out[6] + R14_Out[6] + R15_Out[6] + R16_Out[6] + R17_Out[6] + R18_Out[6] + R19_Out[6] + R20_Out[6]
							+R12_Out[6] + R22_Out[6] + R23_Out[6] + R24_Out[6] + R25_Out[6] + R26_Out[6] + R27_Out[6] + R28_Out[6] + R29_Out[6] + R30_Out[6]
							+R13_Out[6] + R32_Out[6] + R33_Out[6] + R34_Out[6] + R35_Out[6] + R36_Out[6] + R37_Out[6] + R38_Out[6] + R39_Out[6] + R40_Out[6]
							+R14_Out[6] + R42_Out[6] + R43_Out[6] + R44_Out[6] + R45_Out[6] + R46_Out[6] + R47_Out[6] + R48_Out[6] + R49_Out[6] + R50_Out[6]
							+R15_Out[6] + R52_Out[6] + R53_Out[6] + R54_Out[6] + R55_Out[6] + R56_Out[6] + R57_Out[6] + R58_Out[6] + R59_Out[6] + R60_Out[6]
							+R16_Out[6] + R62_Out[6] + R63_Out[6] + R64_Out[6] + R65_Out[6] + R66_Out[6] + R67_Out[6] + R68_Out[6] + R69_Out[6] + R70_Out[6]
							+R17_Out[6] + R72_Out[6] + R73_Out[6] + R74_Out[6] + R75_Out[6] + R76_Out[6] + R77_Out[6] + R78_Out[6] + R79_Out[6] + R80_Out[6]
							+R18_Out[6] + R82_Out[6] + R83_Out[6] + R84_Out[6] + R85_Out[6] + R86_Out[6] + R87_Out[6] + R88_Out[6] + R89_Out[6] + R90_Out[6]
							+R19_Out[6] + R92_Out[6] + R93_Out[6] + R94_Out[6] + R95_Out[6] + R96_Out[6] + R97_Out[6] + R98_Out[6] + R99_Out[6] + R100_Out[6]
							+R100_Out[6] + R102_Out[6] + R103_Out[6] + R104_Out[6] + R105_Out[6] + R106_Out[6] + R107_Out[6] + R108_Out[6] + R109_Out[6] + R110_Out[6]
							+R111_Out[6] + R112_Out[6] + R113_Out[6] + R114_Out[6] + R115_Out[6] + R116_Out[6] + R117_Out[6] + R118_Out[6] + R119_Out[6] + R120_Out[6]
							+R121_Out[6] + R122_Out[6] + R123_Out[6] + R124_Out[6] + R125_Out[6] + R126_Out[6] + R127_Out[6] + R128_Out[6] + R129_Out[6] + R130_Out[6]
							+R131_Out[6] + R132_Out[6] + R133_Out[6] + R134_Out[6] + R135_Out[6] + R136_Out[6] + R137_Out[6] + R138_Out[6] + R139_Out[6] + R140_Out[6]
							+R141_Out[6] + R142_Out[6] + R143_Out[6] + R144_Out[6] + R145_Out[6] + R146_Out[6] + R147_Out[6] + R148_Out[6] + R149_Out[6] + R150_Out[6]
							+R151_Out[6] + R152_Out[6] + R153_Out[6] + R154_Out[6] + R155_Out[6] + R156_Out[6] + R157_Out[6] + R158_Out[6] + R159_Out[6] + R160_Out[6]
							+R161_Out[6] + R162_Out[6] + R163_Out[6] + R164_Out[6] + R165_Out[6] + R166_Out[6] + R167_Out[6] + R168_Out[6]);
	assign win = (R42_Out[6] & R19_Out[6] & R21_Out[6] & R26_Out[6] & R35_Out[6] & R33_Out[6] & R43_Out[6] & R46_Out[6] & R47_Out[6] & R50_Out[6] & R63_Out[6] & R68_Out[6] & R74_Out[6] & R76_Out[6] & R90_Out[6] & R109_Out[6] & R115_Out[6] & R118_Out[6] & R121_Out[6] & R131_Out[6] & R141_Out[6] & R158_Out[6] & R161_Out[6] & R162_Out[6] & R163_Out[6]);					
	always_comb
		begin
			case (indexxx)
				32'b00000000000000000000000000000000:
					value_out = R1_Out;
				32'b00000000000000000000000000000001:
					value_out = R2_Out;
				32'b00000000000000000000000000000010:
					value_out = R3_Out;
				32'b00000000000000000000000000000011:
					value_out = R4_Out;
				32'b00000000000000000000000000000100:
					value_out = R5_Out;
				32'b00000000000000000000000000000101:
					value_out = R6_Out;
				32'b00000000000000000000000000000110:
					value_out = R7_Out;
				32'b00000000000000000000000000000111:
					value_out = R8_Out;
				32'b00000000000000000000000000001000:
					value_out = R9_Out;
				32'b00000000000000000000000000001001:
					value_out = R10_Out;
				32'b00000000000000000000000000001010:
					value_out = R11_Out;
				32'b00000000000000000000000000001011:
					value_out = R12_Out;
				32'b00000000000000000000000000001100:
					value_out = R13_Out;
				32'b00000000000000000000000000001101:
					value_out = R14_Out;
				32'b00000000000000000000000000001110:
					value_out = R15_Out;
				32'b00000000000000000000000000001111:
					value_out = R16_Out;
				32'b00000000000000000000000000010000:
					value_out = R17_Out;
				32'b00000000000000000000000000010001:
					value_out = R18_Out;
				32'b00000000000000000000000000010010:
					value_out = R19_Out;
				32'b00000000000000000000000000010011:
					value_out = R20_Out;
				32'b00000000000000000000000000010100:
					value_out = R21_Out;
				32'b00000000000000000000000000010101:
					value_out = R22_Out;
				32'b00000000000000000000000000010110:
					value_out = R23_Out;
				32'b00000000000000000000000000010111:
					value_out = R24_Out;
				32'b00000000000000000000000000011000:
					value_out = R25_Out;
				32'b00000000000000000000000000011001:
					value_out = R26_Out;
				32'b00000000000000000000000000011010:
					value_out = R27_Out;
				32'b00000000000000000000000000011011:
					value_out = R28_Out;
				32'b00000000000000000000000000011100:
					value_out = R29_Out;
				32'b00000000000000000000000000011101:
					value_out = R30_Out;
				32'b00000000000000000000000000011110:
					value_out = R31_Out;
				32'b00000000000000000000000000011111:
					value_out = R32_Out;
				32'b00000000000000000000000000100000:
					value_out = R33_Out;
				32'b00000000000000000000000000100001:
					value_out = R34_Out;
				32'b00000000000000000000000000100010:
					value_out = R35_Out;
				32'b00000000000000000000000000100011:
					value_out = R36_Out;
				32'b00000000000000000000000000100100:
					value_out = R37_Out;
				32'b00000000000000000000000000100101:
					value_out = R38_Out;
				32'b00000000000000000000000000100110:
					value_out = R39_Out;
				32'b00000000000000000000000000100111:
					value_out = R40_Out;
				32'b00000000000000000000000000101000:
					value_out = R41_Out;
				32'b00000000000000000000000000101001:
					value_out = R42_Out;
				32'b00000000000000000000000000101010:
					value_out = R43_Out;
				32'b00000000000000000000000000101011:
					value_out = R44_Out;
				32'b00000000000000000000000000101100:
					value_out = R45_Out;
				32'b00000000000000000000000000101101:
					value_out = R46_Out;
				32'b00000000000000000000000000101110:
					value_out = R47_Out;
				32'b00000000000000000000000000101111:
					value_out = R48_Out;
				32'b00000000000000000000000000110000:
					value_out = R49_Out;
				32'b00000000000000000000000000110001:
					value_out = R50_Out;
				32'b00000000000000000000000000110010:
					value_out = R51_Out;
				32'b00000000000000000000000000110011:
					value_out = R52_Out;
				32'b00000000000000000000000000110100:
					value_out = R53_Out;
				32'b00000000000000000000000000110101:
					value_out = R54_Out;
				32'b00000000000000000000000000110110:
					value_out = R55_Out;
				32'b00000000000000000000000000110111:
					value_out = R56_Out;
				32'b00000000000000000000000000111000:
					value_out = R57_Out;
				32'b00000000000000000000000000111001:
					value_out = R58_Out;
				32'b00000000000000000000000000111010:
					value_out = R59_Out;
				32'b00000000000000000000000000111011:
					value_out = R60_Out;
				32'b00000000000000000000000000111100:
					value_out = R61_Out;
				32'b00000000000000000000000000111101:
					value_out = R62_Out;
				32'b00000000000000000000000000111110:
					value_out = R63_Out;
				32'b00000000000000000000000000111111:
					value_out = R64_Out;
				32'b00000000000000000000000001000000:
					value_out = R65_Out;
				32'b00000000000000000000000001000001:
					value_out = R66_Out;
				32'b00000000000000000000000001000010:
					value_out = R67_Out;
				32'b00000000000000000000000001000011:
					value_out = R68_Out;
				32'b00000000000000000000000001000100:
					value_out = R69_Out;
				32'b00000000000000000000000001000101:
					value_out = R70_Out;
				32'b00000000000000000000000001000110:
					value_out = R71_Out;
				32'b00000000000000000000000001000111:
					value_out = R72_Out;
				32'b00000000000000000000000001001000:
					value_out = R73_Out;
				32'b00000000000000000000000001001001:
					value_out = R74_Out;
				32'b00000000000000000000000001001010:
					value_out = R75_Out;
				32'b00000000000000000000000001001011:
					value_out = R76_Out;
				32'b00000000000000000000000001001100:
					value_out = R77_Out;
				32'b00000000000000000000000001001101:
					value_out = R78_Out;
				32'b00000000000000000000000001001110:
					value_out = R79_Out;
				32'b00000000000000000000000001001111:
					value_out = R80_Out;
				32'b00000000000000000000000001010000:
					value_out = R81_Out;
				32'b00000000000000000000000001010001:
					value_out = R82_Out;
				32'b00000000000000000000000001010010:
					value_out = R83_Out;
				32'b00000000000000000000000001010011:
					value_out = R84_Out;
				32'b00000000000000000000000001010100:
					value_out = R85_Out;
				32'b00000000000000000000000001010101:
					value_out = R86_Out;
				32'b00000000000000000000000001010110:
					value_out = R87_Out;
				32'b00000000000000000000000001010111:
					value_out = R88_Out;
				32'b00000000000000000000000001011000:
					value_out = R89_Out;
				32'b00000000000000000000000001011001:
					value_out = R90_Out;
				32'b00000000000000000000000001011010:
					value_out = R91_Out;
				32'b00000000000000000000000001011011:
					value_out = R92_Out;
				32'b00000000000000000000000001011100:
					value_out = R93_Out;
				32'b00000000000000000000000001011101:
					value_out = R94_Out;
				32'b00000000000000000000000001011110:
					value_out = R95_Out;
				32'b00000000000000000000000001011111:
					value_out = R96_Out;
				32'b00000000000000000000000001100000:
					value_out = R97_Out;
				32'b00000000000000000000000001100001:
					value_out = R98_Out;
				32'b00000000000000000000000001100010:
					value_out = R99_Out;
				32'b00000000000000000000000001100011:
					value_out = R100_Out;
				100:
					value_out = R101_Out;
				101:
					value_out = R102_Out;
				102:
					value_out = R103_Out;
				103:
					value_out = R104_Out;
				104:
					value_out = R105_Out;
				105:
					value_out = R106_Out;
				106:
					value_out = R107_Out;
				107:
					value_out = R108_Out;
				108:
					value_out = R109_Out;
				109:
					value_out = R110_Out;
				110:
					value_out = R111_Out;
				111:
					value_out = R112_Out;
				112:
					value_out = R113_Out;
				113:
					value_out = R114_Out;
				114:
					value_out = R115_Out;
				115:
					value_out = R116_Out;
				116:
					value_out = R117_Out;
				117:
					value_out = R118_Out;
				118:
					value_out = R119_Out;
				119:
					value_out = R120_Out;
				120:
					value_out = R121_Out;
				121:
					value_out = R122_Out;
				122:
					value_out = R123_Out;
				123:
					value_out = R124_Out;
				124:
					value_out = R125_Out;
				125:
					value_out = R126_Out;
				126:
					value_out = R127_Out;
				127:
					value_out = R128_Out;
				128:
					value_out = R129_Out;
				129:
					value_out = R130_Out;
				130:
					value_out = R131_Out;
				131:
					value_out = R132_Out;
				132:
					value_out = R133_Out;
				133:
					value_out = R134_Out;
				134:
					value_out = R135_Out;
				135:
					value_out = R136_Out;
				136:
					value_out = R137_Out;
				137:
					value_out = R138_Out;
				138:
					value_out = R139_Out;
				139:
					value_out = R140_Out;
				140:
					value_out = R141_Out;
				141:
					value_out = R142_Out;
				142:
					value_out = R143_Out;
				143:
					value_out = R144_Out;
				144:
					value_out = R145_Out;
				145:
					value_out = R146_Out;
				146:
					value_out = R147_Out;
				147:
					value_out = R148_Out;
				148:
					value_out = R149_Out;
				149:
					value_out = R150_Out;
				150:
					value_out = R151_Out;
				151:
					value_out = R152_Out;
				152:
					value_out = R153_Out;
				153:
					value_out = R154_Out;
				154:
					value_out = R155_Out;
				155:
					value_out = R156_Out;
				156:
					value_out = R157_Out;
				157:
					value_out = R158_Out;
				158:
					value_out = R159_Out;
				159:
					value_out = R160_Out;
				160:
					value_out = R161_Out;
				161:
					value_out = R162_Out;
				162:
					value_out = R163_Out;
				163:
					value_out = R164_Out;
				164:
					value_out = R165_Out;
				165:
					value_out = R166_Out;
				166:
					value_out = R167_Out;
				167:
					value_out = R168_Out;
				default:
					value_out = 0;
			endcase
		end


//	 assign deadd = Dead_R1 | Dead_R2 | Dead_R3 | Dead_R4 | Dead_R5 | Dead_R6 | Dead_R7 | Dead_R8 |
//	Dead_R9 | Dead_R10 | Dead_R11 | Dead_R12 | Dead_R13 | Dead_R14 | Dead_R15 | Dead_R16 |
//	Dead_R17 | Dead_R18 | Dead_R19 | Dead_R20 | Dead_R21 | Dead_R22 | Dead_R23 | Dead_R24 |
//	Dead_R25 | Dead_R26 | Dead_R27 | Dead_R28 | Dead_R29 | Dead_R30;
		

endmodule
