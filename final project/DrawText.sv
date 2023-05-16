module DrawText(
		input [9:0] DrawX, DrawY,
		input win,dead,
		output logic on
);
	logic [9:0] positionX, positionY;
	assign positionX = DrawX - 448;
	assign positionY = DrawY - 80;
	logic on_w, on_l;
	
	font_romtext text(.dx(positionX), .dy(positionY), .win(win), .lose(dead), .on(on_w));
	font_romtext text2(.dx(positionX), .dy(positionY), .win(1'b0), .lose(1'b0), .on(on_l));
	
	always_comb
	begin
		if((dead | win) & positionY < 100)
			on = on_w;
		else
			on = on_l;
	end
	
endmodule
