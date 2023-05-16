/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

//logic [31:0] LOCAL_REG [`NUM_REGS]; // Registers
////put other local variables here
//
//logic [31:0] Control_Reg;





logic IV0, IV1, IV2, IV3; 
logic [6:0] CODE0, CODE1, CODE2, CODE3;

logic RESERVED;
logic [3:0] BKG_B, BKG_G, BKG_R, FGD_B, FGD_G, FGD_R;
logic [6:0] RSVD; 

logic [6:0] Cx;
logic [5:0] Cy;
logic [11:0] Ac;

logic [11:0] Av;
logic [11:0] addressB;

logic [31:0] Cq;
//
logic [15:0] C;

logic [10:0] F_A;
logic [7:0] Line, on;
logic Inv;

logic [31:0] data_b; 
logic wren_a;
assign wren_a = AVL_CS & AVL_WRITE;
logic [31:0] tempdata_vram;
//.address_b(Av)
ram VRam(.address_a(AVL_ADDR), .byteena_a(AVL_BYTE_EN), .data_a(AVL_WRITEDATA), .wren_a(AVL_WRITE & AVL_CS & ~AVL_ADDR[11]), .q_a(tempdata_vram), .address_b(addressB), .data_b(AVL_WRITEDATA), .wren_b(1'b0), .q_b(Cq), .clock(CLK));

logic [31:0] color_palette[8];

//Declare submodules..e.g. VGA controller, ROMS, etc

	 logic pixelclk, blank, sync;
	 logic [9:0] DrawX, DrawY;
	 vga_controller VGA(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(pixelclk), .blank(blank), .sync(sync), .DrawX(DrawX), .DrawY(DrawY));	

// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
always_ff @(posedge CLK) begin
	if(AVL_ADDR[11] & AVL_WRITE & AVL_CS)
		begin
			color_palette[AVL_ADDR[2:0]] <= AVL_WRITEDATA;
		end
	if(AVL_ADDR[11] & AVL_READ & AVL_CS)
		begin
			AVL_READDATA <= color_palette[AVL_ADDR[2:0]];
		end
	if(~AVL_ADDR[11] & AVL_READ & AVL_CS)
		begin
			AVL_READDATA <= tempdata_vram;
		end
end

logic [11:0] color;

always_comb  
	begin
				Cx = DrawX[9:3]; //column
				Cy = DrawY[9:4]; //row
				Ac = Cx + Cy * 80; // order of the character
				Av = Ac[11:1]; // Ac/4 = order of the register
				addressB = Av;
				//AC/2 for 6.2
//				Cq = LOCAL_REG[Av]; //data from the register
				case (Ac[0])
					1'b0:
					//character 0
						C = Cq[15:0];
					1'b1:
					//character 1
						C = Cq[31:16];
				endcase
				F_A = C[14:8] * 16 + DrawY[3:0]; // indicate which exact line (that's the address)
		end

font_rom fontrom(.addr(F_A), .data(Line));
					
assign on = Line[7-DrawX[2:0]]; // flip on the screen
					
assign Inv = C[15]; // Inverted

//handle drawing (may either be combinational or sequential - or both).

logic[3:0] FGD_IDX;
logic[3:0] BKG_IDX;
logic [31:0] color_32_F;
logic [11:0] color_12_F;
logic [31:0] color_32_B;
logic [11:0] color_12_B;

assign FGD_IDX = C[7:4];
assign BKG_IDX = C[3:0];

assign color_32_F = color_palette[FGD_IDX[3:1]];
assign color_32_B = color_palette[BKG_IDX[3:1]];

always_ff @(posedge pixelclk) 
begin
	if (FGD_IDX[0])
		begin
			color_12_F <= color_32_F[24:13];
		end
	else
		begin
			color_12_F <= color_32_F[12:1];
		end
	FGD_R <= color_12_F[11:8];
	FGD_G <= color_12_F[7:4];
	FGD_B <= color_12_F[3:0];
end

always_ff @(posedge pixelclk) 
begin
	if (BKG_IDX[0])
		begin
			color_12_B <= color_32_B[24:13];
		end
	else
		begin
			color_12_B <= color_32_B[12:1];
		end
	BKG_R <= color_12_B[11:8];
	BKG_G <= color_12_B[7:4];
	BKG_B <= color_12_B[3:0];
end

always_ff @(posedge pixelclk) 
begin
	if (blank)
		begin
		
			if (Inv^on)
				begin
					red <= FGD_R;
					green <= FGD_G;
					blue <= FGD_B;
				end
			else
				begin
					red <= BKG_R;
					green <= BKG_G;
					blue <= BKG_B;
				end
		end 
	else
		begin 
			red <= 4'h1; 
			green <= 4'h1; 
			blue <= 4'h1;
		end 
end


		

endmodule
