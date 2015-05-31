// Christopher Hays
// ECE 176
// Assignment 12
// Self Correcting State Machine
// selfcorrecting.v


module selfcorrecting(input clk, x, reset, output reg seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g);

    // current flip-flop outputs
	wire Y2, Y1, Y0;
	wire a_, b_, c_, d_, e_, f_, g_;

    // state equations assigned to the flip-flop inputs
	wire D2 = (Y2 & ~Y1) + (Y2 & Y1 & Y0) + (~Y2 & Y1 & ~Y0),
        D1 = (Y1 & Y0) + (~Y2 & ~Y1 & Y0) + (Y2 & ~Y1 & ~Y0), 
	     D0 = (~x & Y2 & ~Y1 & ~Y0) + (x & ~Y2 & ~Y1 & ~Y0) + (~x & ~Y2 & ~Y1 & Y0) + (~x & ~Y2 & Y1 & ~Y0) + (x & Y2 & Y1 & ~Y0);

    // most significant bit of the state
	dff_custom DFF2(.clk(clk),
			          .dff_in(D2),
		             .dff_out(Y2),
		             .reset(reset)
			         );
               
	// middle bit of the state		 
	dff_custom DFF1(.clk(clk),
			          .dff_in(D1),
			          .dff_out(Y1),
			          .reset(reset)
		            );
               
    // least significant bit of the state
	dff_custom DFF0(.clk(clk),
		             .dff_in(D0),
			          .dff_out(Y0),
		             .reset(reset)
		            );
				
	 // the seven segment controller
	sevensegment S1 (.in({Y2, Y1, Y0}),
						  .a(a_), 
					     .b(b_), 
					     .c(c_), 
					     .d(d_), 
					     .e(e_), 
					     .f(f_), 
					     .g(g_)
					    );

    // output assignments, seven segment displays are active low          
	always begin
		seg_a <= ~a_;
		seg_b <= ~b_;
		seg_c <= ~c_;
		seg_d <= ~d_;
		seg_e <= ~e_;
		seg_f <= ~f_;
		seg_g <= ~g_;
	 end
	
endmodule
