module  Cursor ( input Reset, frame_clk, stop, waitsig,
					input [7:0] keycode,
               output [9:0]  index_X, index_Y, CursorS,
					output setFlag, clearFlag, clear, is_start);
					
		logic [9:0] X_Pos, X_Motion, Y_Pos, Y_Motion;
		logic setflag, clr;
		logic [4:0] counter;
		always_ff @ (posedge Reset or posedge frame_clk)
		begin: Move_Cursor
			if (Reset)
			begin
				is_start <= 0;
            X_Motion <= 10'd0;
				Y_Motion <= 10'd0;	
				X_Pos <= 10'b0000000111;
				Y_Pos <= 10'b0000000110;
        end
		  
		  else if (keycode == 8'h28)
		  begin
			is_start <= 1;
			counter <= 0;
			end
	     else if (stop)
			is_start <= 0;
		  else if (is_start == 1 & waitsig == 0)
				 begin
				 if(counter == 30)
						counter <= 0;
				 case (keycode)
					8'h04 : begin
								X_Pos <= X_Pos - counter[0];
								//X_Motion <= -1;//A
								Y_Motion <= 0;
								setFlag <=0;
								clearFlag <= 0;
								counter <= counter+1;
							  end
					        
					8'h07 : begin
								X_Pos <= X_Pos + counter[0];
					        //X_Motion <= 1;//D
							  Y_Motion <= 0;
							  setFlag <=0;
							  clearFlag <= 0;
							  counter <= counter+1;
							  end

							  
					8'h16 : begin
								Y_Pos <= Y_Pos + counter[0];
					        X_Motion <= 0;//S
							  //Y_Motion <= 1;
							  setFlag <=0;
							  clearFlag <= 0;
							  counter <= counter+1;
							 end
							  
					8'h1A : begin
								Y_Pos <= Y_Pos - counter[0];
					        X_Motion <= 0;//W
							  //Y_Motion <= -1;
							  setFlag <=0;
							  clearFlag <= 0;
							  counter <= counter+1;
							 end
					8'h09 : begin
								setFlag <= 1;
								clr <= 0;
								clearFlag <= 0;
								counter <= counter+1;
								end
					8'h06 : begin
								clr <= 1;
								setFlag <= 0;
								clearFlag <= 0;
								counter <= counter+1;
							  end
					8'h0a : begin
								clr <= 0;
								setFlag <= 0;
								clearFlag <= 1;
								counter <= counter+1;
							  end
					default: begin
							X_Motion <= 0;
							Y_Motion <= 0;
							setFlag <= 0;
							clr <= 0;
							clearFlag <= 0;
							end
			   endcase
			end
		end
		
		
					
		assign index_X = X_Pos % 14;
		assign index_Y = Y_Pos % 12;
		assign clear = clr;
		assign CursorS = 16;
		
endmodule
