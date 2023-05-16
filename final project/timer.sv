module digital_clock(input clk, stop,
							output[7:0] sec,
							output[3:0] min);

localparam N = 26;
reg [N-1:0] slow_clk = 0;
reg [7:0] countsec = 0;
reg [3:0] countmin = 0;

wire enable;

always @ (posedge clk) begin
	if (slow_clk == 26'd49)
		slow_clk <= 8'b0;
	else if(~stop)
		slow_clk <= slow_clk + 8'b1;	
	end
	
assign enable = (slow_clk == 26'd49);


always @ (posedge clk) begin
	if (enable == 1'b1)
		if (countsec == 8'b00111011)
		begin
			countsec <= 8'b0;
			countmin <= countmin + 4'b1;
		end
		else if(~stop)
			countsec <= countsec + 8'b1;
	end
	
assign sec = countsec;
assign min = countmin;

endmodule
		
