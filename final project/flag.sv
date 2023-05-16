
module  cursor ( input Reset, frame_clk,
					input [7:0] keycode,
               output [9:0] FlagX, FlagY, FlagS);
    
	 logic [9:0] posX, posY, moveX, moveY;
    always_comb
	 begin: Move_Cursor
		if(keycode == 8'h04)
			begin
				moveX = - 40;//A
			end
		else if(keycode == 8'h07)			        
			begin
				moveX = 40;//D
			end
		else if(keycode == 8'h16)
			begin
				moveY = 40;//S
			end
		else if(keycode == 8'h1A)
			begin
				moveY = - 40;//W
			end	  
		else
			begin
				moveX = 0;//no change
				moveY = 0;
			end
	 end
	 
	 assign posX = posX + moveX;
	 assign posY = posY + moveY;
	 
	 assign FlagS = 8;
	 assign FlagX = posX;
	 assign FlagY = posY;

endmodule
