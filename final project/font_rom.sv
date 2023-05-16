module font_rom (input logic [2:0] indexx, indexy,
					  input logic [2:0] number,
					  input logic flag, mine, dead,
					  output logic pixel);
					  
					  
	logic [7:0] ROM [8];
	logic [4:0] numberFM;
	assign numberFM[4] = flag;
	assign numberFM[3] = mine;
	assign numberFM[2:0] = number;
	
	always_comb
    begin
		if(numberFM[4])
		begin
			ROM[0] = 8'b00000000;
					ROM[1] = 8'b00011000;
					ROM[2] = 8'b00111000;
					ROM[3] = 8'b01111000;
					ROM[4] = 8'b00001000;
					ROM[5] = 8'b00001000;
					ROM[6] = 8'b00011100;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
		end
		else if (numberFM[3])
		begin
			ROM[0] = 8'b00100001;
					ROM[1] = 8'b00111100;
					ROM[2] = 8'b00111100;
					ROM[3] = 8'b11111111;
					ROM[4] = 8'b00111100;
					ROM[5] = 8'b00111100;
					ROM[6] = 8'b01000010;
					ROM[7] = 8'b10000001;
					pixel = ROM[indexy][indexx];
		end
		else if (dead)
		begin
			ROM[0] = 8'b00100001;
					ROM[1] = 8'b10000001;
					ROM[2] = 8'b01000010;
					ROM[3] = 8'b00100100;
					ROM[4] = 8'b00011000;
					ROM[5] = 8'b00011000;
					ROM[6] = 8'b00100100;
					ROM[7] = 8'b01000010;
					pixel = ROM[indexy][indexx];
		end
		else
		begin
			case (numberFM)
				5'b00001: //number1
				begin
					ROM[0] = 8'b00000000;
					ROM[1] = 8'b00011000;
					ROM[2] = 8'b00011000;
					ROM[3] = 8'b00011000;
					ROM[4] = 8'b00011000;
					ROM[5] = 8'b00011000;
					ROM[6] = 8'b00000000;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
				end
				5'b00010: //number2
				begin
					ROM[0] = 8'b00000000;
					ROM[1] = 8'b00111100;
					ROM[2] = 8'b00100000;
					ROM[3] = 8'b00111100;
					ROM[4] = 8'b00000100;
					ROM[5] = 8'b00111100;
					ROM[6] = 8'b00000000;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
				end
				5'b00011: //number3
				begin
					ROM[0] = 8'b00000000;
					ROM[1] = 8'b00111100;
					ROM[2] = 8'b00100000;
					ROM[3] = 8'b00111100;
					ROM[4] = 8'b00100000;
					ROM[5] = 8'b00111100;
					ROM[6] = 8'b00000000;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
				end
				5'b00100: //number4
				begin
					ROM[0] = 8'b00000000;
					ROM[1] = 8'b00100100;
					ROM[2] = 8'b00100100;
					ROM[3] = 8'b00111100;
					ROM[4] = 8'b00100000;
					ROM[5] = 8'b00100000;
					ROM[6] = 8'b00000000;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
				end
				5'b00101: //number5
				begin
					ROM[0] = 8'b00000000;
					ROM[1] = 8'b00111100;
					ROM[2] = 8'b00000100;
					ROM[3] = 8'b00111100;
					ROM[4] = 8'b00100000;
					ROM[5] = 8'b00111100;
					ROM[6] = 8'b00000000;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
				end
				5'b00110: //number6
				begin
					ROM[0] = 8'b00000000;
					ROM[1] = 8'b00111100;
					ROM[2] = 8'b00000100;
					ROM[3] = 8'b00111100;
					ROM[4] = 8'b00100100;
					ROM[5] = 8'b00111100;
					ROM[6] = 8'b00000000;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
				end
				5'b00111: //number7
				begin
					ROM[0] = 8'b00000000;
					ROM[1] = 8'b00111100;
					ROM[2] = 8'b00100000;
					ROM[3] = 8'b00100000;
					ROM[4] = 8'b00100000;
					ROM[5] = 8'b00100000;
					ROM[6] = 8'b00000000;
					ROM[7] = 8'b00000000;
					pixel = ROM[indexy][indexx];
				end
				default:
				begin
					pixel = 0;
				end
			endcase
			end
	end
					  
endmodule
						