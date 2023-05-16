module Control
(
		input logic Run, ClearA_LoadB, Clk, Reset, M,
		output logic Clr_Ld, Shift, Add, Sub, M_II
);

	enum logic[4:0] {reset, Halt, clear_load, Add0, Add1, Add2, Add3, Add4, Add5, Add6,
							Shift0, Shift1, Shift2, Shift3, Shift4, Shift5, Shift6, Shift7,
							sub} curr_state, next_state;
	always_ff @ (posedge Clk or posedge ClearA_LoadB)
	begin
		if (ClearA_LoadB)
			curr_state = reset;
		else
			curr_state = next_state;
	end
	
	 // Assign outputs based on state
	always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 
				Halt: if(ClearA_LoadB)
							next_state = clear_load;
						else if (Run&M)
							next_state = Add0;
						else if(Run&(~M))
							next_state = Shift0;
							
				reset : next_state = Halt;
				clear_load : next_state = Halt;
						 
            Add0 : next_state = Shift0;
				Add1 : next_state = Shift1;
				Add2 : next_state = Shift2;
				Add3 : next_state = Shift3;
				Add4 : next_state = Shift4;
				Add5 : next_state = Shift5;
				Add6 : next_state = Shift6;
				
				Shift0: if(M)
								next_state = Add1;
							else
								next_state = Shift1;
				Shift1: if(M)
								next_state = Add2;
							else
								next_state = Shift2;
				Shift2: if(M)
								next_state = Add3;
							else
								next_state = Shift3;
				Shift3: if(M)
								next_state = Add4;
							else
								next_state = Shift4;
				Shift4: if(M)
								next_state = Add5;
							else
								next_state = Shift5;
				Shift5: if(M)
								next_state = Add6;
							else
								next_state = Shift6;
				Shift6: if(M)
								next_state = sub;
							else
								next_state = Shift7;
				sub: 		next_state = Shift7;
            Shift7: if(~Run) 
                        next_state = Halt;
				default: next_state = Halt;		
        endcase
		  
		  // Assign outputs based on ‘state’
		  M_II = 1'b0;
        case (curr_state) 
	   	   Halt: 
	         begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 M_II = 1'b1;
		      end
	   	   Add0: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
					 M_II = 1'b0;
		      end
				Add1: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
		      end
				Add2: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
		      end
				Add3: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
		      end
				Add4: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
		      end
				Add5: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
		      end
				Add6: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b1;
					 Sub = 1'b0;
		      end
				Shift0: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				Shift1: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				Shift2: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				Shift3: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				Shift4: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				Shift5: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				Shift6: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				Shift7: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				sub: 
		      begin
                Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b1;
		      end
	   	   reset: 
		      begin
                Clr_Ld = 1'b1;
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 M_II = 1'b1;
		      end
				default:
				begin
					Clr_Ld = 1'b0;
					 Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
				end
        endcase
	end
endmodule
