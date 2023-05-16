module data ( input [31:0]	addr,
						output [7:0]	data
					 );

	parameter DATA_SIZE = 168;
   parameter DATA_WIDTH =  8;
				
	// ROM definition				
	parameter [0:DATA_SIZE][DATA_WIDTH-1:0] ROM = {
			//row1
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000001, //empty
			//row2
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00001001, //number2
			8'b00100001, //flag
			8'b00010001, //number4
			8'b00100001, //flag
			8'b00001001, //number2
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00001001, //number2
			8'b00000101, //number1
			//row3
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00010001, //number4
			8'b00100001, //flag
			8'b00010101, //number5
			8'b00100001, //flag
			8'b00001101, //number3
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00100001, //flag
			//row4
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00100001, //flag
			8'b00010001, //number4
			8'b00001101, //number3
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00000101, //number1
			//row5
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00001101, //number3
			8'b00010001, //number4
			8'b00001101, //number3
			8'b00100001, //flag
			8'b00001001, //number2
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000001, //empty
			//row6
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00001101, //number3
			8'b00100001, //flag
			8'b00001101, //number3
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000001, //empty
			//row7
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001101, //number3
			8'b00100001, //flag
			8'b00001001, //number2
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			//row,8
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00001001, //number2
			8'b00001001, //number2
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			//row9
			8'b00000001, //empty
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00001001, //number2
			8'b00001001, //number2
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00001001, //number2
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			//row1,0
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00100001, //flag
			8'b00001001, //number2
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001, //empty
			//row11
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00001001, //number2
			8'b00001001, //number2
			8'b00001001, //number2
			8'b00001001, //number2
			8'b00001101, //number3
			8'b00001001, //number2
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001, //empty
			//row12
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000101, //number1
			8'b00100001, //flag
			8'b00100001, //flag
			8'b00100001, //flag
			8'b00000101, //number1
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001, //empty
			8'b00000001 //empty
        };

	assign data = ROM[addr];

endmodule  