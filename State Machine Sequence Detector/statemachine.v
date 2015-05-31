// Christopher Hays
// ECE 176
// Assignment 11
// State Machine Sequence Detector
// statemachine.v


module statemachine(input clk, x, reset, output reg w, a, b, c);

    // current flip-flop outputs
	wire Y2, Y1, Y0;

    // state equations assigned to the flip-flop inputs
	wire D2 = (~x & Y2 & ~Y1 & ~Y0) + (x & ~Y2 & Y1 & Y0),
		  D1 = (x & ~Y2 & ~Y1 & Y0) + (~x & ~Y2 & Y1 & ~Y0), 
		  D0 = (Y2 & ~Y1 & ~Y0) + (x & ~Y2 & ~Y0) + (~Y2 & Y1 & ~Y0) + (x & Y2 & ~Y1);

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
				
    // output assignments            
	always begin
		w = (Y2 & ~Y1 & Y0); // state 101 pulses the line
        
		a = Y2; // abc outputs represent the current state 
		b = Y1;
		c = Y0;
	end	

endmodule
