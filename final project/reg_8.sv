module reg_8 (input  logic Clk, Load, clear, start, clearFlag, END, //Load is flag
              input  logic [7:0]  D, 
              output logic [7:0]  Data_Out, dead);
				 
	
    always_ff @ (posedge Clk)
		begin
		if (END) //game end
			Data_Out <= D; //all dead.
		else if (~start) //game not start
		begin
			Data_Out <= 8'b00000010; //all green
			dead <= Data_Out[7];
		end
		else //game start
			begin
				if (clear | (~Data_Out[1]) | Data_Out[7]) // set clear
				begin
					if(D[5])
					begin
						Data_Out <= 8'b10000000; //dead
						dead <= Data_Out[7];
					end
					else
					begin
						Data_Out <= D; //Data
						dead <= Data_Out[7];
					end
				end
				else if ((Load | Data_Out[6]) & ~clearFlag)
				begin
					Data_Out <= 8'b01000011; //flag
					dead <= Data_Out[7];
				end
				else if (clearFlag | Data_Out[1])
				begin
					Data_Out <= 8'b00000011; //clear flag
					dead <= Data_Out[7];
				end
				else
				begin
					Data_Out <= 8'b00000011; //grass
					dead <= Data_Out[7];
				end	
			end
		end

endmodule
