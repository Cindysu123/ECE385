module control(input Clk, input [7:0] move, output stop);

	enum logic[2:0] {Halt, Wait1, Wait2, Wait3, Wait4, Wait5} curr_state, next_state;
	
	always_ff @ (posedge Clk)
	begin
		if (Clk)
			curr_state = Halt;
		else
			curr_state = next_state;
	end
	
	// Assign outputs based on state
	always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 
				Halt: if(move != 0)
							next_state = Wait1;
						 
            Wait1 : next_state = Wait2;
				Wait2 : next_state = Wait3;
				Wait3 : next_state = Wait4;
				Wait4 : next_state = Wait5;
				Wait5 : next_state = Halt;
				
				default: next_state = Halt;		
        endcase
		  
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   Halt: 
	         begin
                stop = 1'b0;
		      end
	   	   Wait1: 
		      begin
                stop = 1'b1;
		      end
				Wait2: 
		      begin
                stop = 1'b1;
		      end
				Wait3: 
		      begin
                stop = 1'b1;
		      end
				Wait4: 
		      begin
                stop = 1'b1;
		      end
				Wait5: 
		      begin
                stop = 1'b0;
		      end
        endcase
	end
		
endmodule
