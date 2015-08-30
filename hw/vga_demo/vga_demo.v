
//=======================================================
//  Ports generated by Terasic System Builder
//=======================================================

module vga_demo(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY, 

	//////////// VGA //////////
	output		          		VGA_CLK,
	output		     [7:0]		VGA_R,
	output		     [7:0]		VGA_G,	
	output		     [7:0]		VGA_B,
	output		          		VGA_HS,	
	output		          		VGA_VS,
	output		          		VGA_BLANK_N,
	output		          		VGA_SYNC_N	
);

//Generate VGA signals
vga_sync (
	.clock (CLOCK_50),
	.aresetn(KEY[0:0]),
	.color (KEY[3:1]),
	
	.vga_clk(VGA_CLK),
	.R (VGA_R),
	.G (VGA_G),
	.B (VGA_B),
	.h_sync(VGA_HS),
	.v_sync(VGA_VS),
	.blank_n(VGA_BLANK_N),
	.sync_n(VGA_SYNC_N)
);

endmodule
