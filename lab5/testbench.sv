module testbench();

timeunit 10ns;
timeprecision 1ns;

logic Clk = 0;
logic Run, Continue;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [9:0] LED;
logic [9:0] SW;

logic [15:0] PC, MAR, MDR, IR;

slc3_testtop slc3_testtop(.*);

assign PC = slc3_testtop.slc.d0.PC;

initial begin: CLOCK_INITIALIZATION
	Clk = 0;
end

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

//initial begin: INTERNAL_FORCES
//	#1 force slc3_testtop.slc.d0.PC = 16'h0000;
//	#1 force slc3_testtop.slc.d0.MAR = 16'h0000;
//	#1 force slc3_testtop.slc.d0.MDR = 16'h0000;
//	#1 force slc3_testtop.slc.d0.IR = 16'h0000;
//	#1 release slc3_testtop.slc.d0.PC;
//	#1 release slc3_testtop.slc.d0.MAR;
//	#1 release slc3_testtop.slc.d0.MDR;
//	#1 release slc3_testtop.slc.d0.IR;
//	
//end


initial begin: TEST_VECTORS

Run = 1;
Continue = 1;
SW = 10'b0000000000;
#2 Run = 0;
   Continue = 0;
   SW = 10'b0000000011;
#2 Run = 1;
	Continue = 1;

#4 Run = 0;

#2 SW = 10'b0000000111;

#2 Run = 1;

#20 Continue = 0;
	
#2 Continue = 1;

#10 Continue = 0;

#2 Continue = 1;

#10 Continue = 0;

#2 Continue = 1;

#10 Continue = 0;

#2 Continue = 1;

end

endmodule
