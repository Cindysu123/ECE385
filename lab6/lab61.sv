/*---------------------------------------------------------------------------
  --      lab61.sv                                                          --
  --      Christine Chen                                                   --
  --      10/23/2013                                                       --
  --      modified by Zuofu Cheng                                          --
  --      For use with ECE 385                                             --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/
// Top-level module that integrates the Nios II system with the rest of the hardware

module lab61(    input	       MAX10_CLK1_50, //50 MHz clock input
					  input  [1:0]  KEY,			//0 for reset, 1 for accumulate
					  input  [7:0]  SW,	//Switches for the accumulation input
					  output [7:0]  LEDR,   //LED display of the accumulator(input or output?)
					  
					  output [12:0] DRAM_ADDR, //SDRAM Address 13 Bits
					  output [1:0]  DRAM_BA,   //SDRAM Bank Address 2 Bits
					  output        DRAM_CAS_N, //SRAM Column Address Strobe
					  output	    DRAM_CKE,    //SDRAM Clock Enable
					  output	    DRAM_CS_N,   //SDRAM Chip Select
					  inout  [15:0] DRAM_DQ, //SDRAM Data 16 Bits
					  output		DRAM_LDQM,
					  output 		DRAM_UDQM, //DRAM_DQM[1:0] Data Mask 4 Bits
					  output	    DRAM_RAS_N, //SDRAM Row Address Strobe
					  output	    DRAM_WE_N, //SDRAM Write Enable
					  output	    DRAM_CLK //SDRAM clock
				  
				  );
				  
				  // You need to make sure that the port names here are identical to the port names at 
				  // the interface in lab61_soc.v
				  lab61soc m_lab61_soc (.clk_clk(MAX10_CLK1_50),
											 .reset_reset_n(KEY[0]), 
											 .led_wire_export(LEDR), 
											//SDRAM
											.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
											.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
											.sdram_wire_ba(DRAM_BA),                             //.ba
											.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
											.sdram_wire_cke(DRAM_CKE),                           //.cke
											.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
											.sdram_wire_dq(DRAM_DQ),                             //.dq
											.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
											.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
											.sdram_wire_we_n(DRAM_WE_N),											//.we_n
											.acc_wire_export(KEY[1]),
											.sw_wire_export(SW)
											 );
											 
				//Instantiate additional FPGA fabric modules as needed		  
endmodule
