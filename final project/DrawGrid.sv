module DrawGrid (	
	input [7:0] Grid, 
	input [4:0] gridx, gridy,
	input logic[2:0] index_x, index_y,
	output logic [7:0]  Red, Green, Blue
	
);

logic [7:0] rr,gg,bb;
logic [2:0] num;
logic pix;
logic [2:0] inx, iny;
assign inx = index_x;
assign iny = index_y;
logic [5:0] sum;
assign sum = gridx + gridy;
font_rom fontrom(.indexx(inx), .indexy(iny), .number(Grid[4:2]), .pixel(pix), .flag(Grid[6]), .mine(Grid[5]), .dead(Grid[7]));

always_comb
    begin
	 if(Grid[6]) //flag
	 begin
		if(pix)
					begin
						rr = 8'ha5;
						gg = 8'h1c;
						bb = 8'h30;
					end
					else
					begin
						if(sum[0])
						begin
							rr = 8'h66;
							gg = 8'hff;
							bb = 8'h66;
						end
						else
						begin
							rr = 8'h3e;
							gg = 8'ha4;
							bb = 8'h02;
						end
					end
	 end
	 else if (Grid[5]) //mine
	 begin
		if(pix)
					begin
						rr = 8'h24;
						gg = 8'h24;
						bb = 8'h24;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
	 end
	 else if (Grid[7]) //dead
	 begin
		if(pix)
					begin
						rr = 8'hfd;
						gg = 8'hf5;
						bb = 8'he6;
					end
					else
					begin
						rr = 8'h3b;
						gg = 8'h2f;
						bb = 8'h2f;
					end
	 end
	 else
		  begin
			case (Grid)
				8'b00000001: //ground
				begin
					rr = 8'hff;
					gg = 8'hd9;
					bb = 8'h66;
				end
				8'b00000011: //grass
				begin
					if(sum[0])
					begin //lighter color
						rr = 8'h66;
						gg = 8'hff;
						bb = 8'h66;
					end
					else
					begin //darker color
						rr = 8'h3e;
						gg = 8'ha4;
						bb = 8'h02;
					end
				end
				8'b00000101: //number1
				begin
					if(pix)
					begin
						rr = 8'h21;
						gg = 8'h00;
						bb = 8'h88;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
				end
				8'b00001001: //number2
				begin
					if(pix)
					begin
						rr = 8'h21;
						gg = 8'h00;
						bb = 8'h88;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
				end
				8'b00001101: //number3
				begin
					if(pix)
					begin
						rr = 8'h21;
						gg = 8'h00;
						bb = 8'h88;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
				end
				8'b00010001: //number4
				begin
					if(pix)
					begin
						rr = 8'h21;
						gg = 8'h00;
						bb = 8'h88;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
				end
				8'b00010101: //number5
				begin
					if(pix)
					begin
						rr = 8'h21;
						gg = 8'h00;
						bb = 8'h88;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
				end
				8'b00011001: //number6
				begin
					if(pix)
					begin
						rr = 8'h21;
						gg = 8'h00;
						bb = 8'h88;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
				end
				8'b00011101: //number7
				begin
					if(pix)
					begin
						rr = 8'h21;
						gg = 8'h00;
						bb = 8'h88;
					end
					else
					begin
						rr = 8'hff;
						gg = 8'hd9;
						bb = 8'h66;
					end
				end
				default:
				begin
					rr = 8'h66;
					gg = 8'hff;
					bb = 8'h66;
				end
			endcase
		end
	end
	

	
assign Red = rr;
assign Green = gg;
assign Blue = bb;

endmodule
