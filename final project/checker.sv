//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

	 `define NUM_REGS 168 


module  checker ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
						input			blank,
						input			flag, clr, frame_clk, start, clearFlaggg,
                  output logic [7:0]  Red, Green, Blue, deadd, numFlagg,
						output stop);
	 
//	 initial begin
//		integer seed,i,j;
//		for (i = 0; i < 167; i = i+1)
//			begin
//				a = $urandom%67;
//				assign Contents[i] = 8'b00000011;
//			end
//		$finish;
//	end
	 
	 
	 
	 //cursor
	 logic ball_on;
	 int DistX, DistY, Size;
	 assign DistX = DrawX - (Size * 2 * BallX + 16);
    assign DistY = DrawY - (80 + Size * 2 * BallY + 16);
    assign Size = Ball_size;
	 
	 always_comb
    begin:Ball_on_proc
        if ((DrawX >= (Size * 2 * BallX + 16) - Ball_size) &&
       (DrawX <= (Size * 2 * BallX + 16) + Ball_size) &&
       (DrawY >= (80 + Size * 2 * BallY + 16) - Ball_size) &&
       (DrawY <= (80 + Size * 2 * BallY + 16) + Ball_size))  
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
	  
//	  always_comb
//	  begin:setFlag
//			if(flag)
//			begin
//				Contents[BallY*14 + BallX] = 8'b01000011; //flag
//			end
//	  end
	
	  
	 
	 logic color_ground;
	 
	 logic[4:0] index_xx;
	 logic[4:0] index_yy;
	 
	 logic[9:0] shift_y;
	 logic[7:0] reg_val;
	 logic[31:0] index;
	 logic[9:0] DrawY_temp;
	 
	 
	 
    always_comb
    begin:Grid 
		 DrawY_temp = DrawY - 10'b0001010000;
		 index_xx = DrawX[9:5];
		 index_yy = DrawY_temp[9:5];
		 index = index_yy*14 + index_xx;
	 end
	 
	 logic gamewin;
	 content regvalue(.numFlag(numFlagg), .clearFlag(clearFlaggg), .deadd(deadd), .start(start), .clear(clr), .frame_clk(frame_clk), .flag(flag), .indexxx(index), .value_out(reg_val), .cursorx(BallX), .cursory(BallY), .win(gamewin));
	 
	 logic [7:0] R1, G1, B1, Rf2, Gf2, Bf2, Rb2, Gb2, Bb2, Rf3, Gf3, Bf3, Rb3, Gb3, Bb3;
	 
	 assign Rb2 = 8'hff;
	 assign Gb2 = 8'hff;
	 assign Bb2 = 8'hff;
	 
	 assign Rf2 = 8'h27;
	 assign Gf2 = 8'h00;
	 assign Bf2 = 8'h4D;
	 
	 assign Rb3 = 8'hfe;
	 assign Gb3 = 8'hff;
	 assign Bb3 = 8'ha3;
	 
	 assign Rf3 = 8'h27;
	 assign Gf3 = 8'h00;
	 assign Bf3 = 8'h4D;
	 
	 logic on, on2;
	 logic [2:0] ind_x, ind_y;
	 logic [9:0] temp_y;
	 assign ind_x  = DrawX[4:2];
	 assign temp_y = DrawY-10'b0001010000;
	 assign ind_y  = temp_y[4:2];
	 DrawGrid draw(.gridx(index_xx), .gridy(index_yy), .Grid(reg_val), .Red(R1), .Green(G1), .Blue(B1), .index_x(ind_x), .index_y(ind_y));
	 DrawText text(.DrawX(DrawX), .DrawY(DrawY), .on(on), .win(gamewin), .dead(deadd));
	 DrawText text2(.DrawX(DrawX), .DrawY(DrawY), .on(on2), .win(1'b0), .dead(1'b0));
    always_comb
    begin:RGB_Display
	 if(blank)
	 begin
		  if((DrawY>80) & (DrawY<464) & (DrawX<448))
		  begin
				if ((ball_on == 1'b1)) 
				  begin 
						Red = 8'h77;
						Green = 8'hb4;
						Blue = 8'hf8;
				  end
			  else
				  begin 
						Red = R1;
						Green = G1;
						Blue = B1;
				  end
       end else if ((DrawX>448) & (DrawY>80) & (DrawY<160) & (gamewin|deadd))
		 begin
			if(on)
			begin
				Red = Rf2;
				Green = Gf2;
				Blue = Bf2;
			end
			else
			begin
				Red = Rb2;
				Green = Gb2;
				Blue = Bb2;
			end
		 end else if ((DrawX>448) & (DrawY<464) & (DrawY>160))
		 begin
			if(on2)
			begin
				Red = Rf3;
				Green = Gf3;
				Blue = Bf3;
			end
			else
			begin
				Red = Rb3;
				Green = Gb3;
				Blue = Bb3;
			end
		end
		 else
			begin
			Red = 0;
			Green = 0;
			Blue = 0;
			end
		end 
	else 
		begin 
			Red = 8'h0; 
			Green = 8'h0; 
			Blue = 8'h0;
		end 
    end : RGB_Display

	 
assign stop = gamewin | deadd ;
    
endmodule
