// Christopher Hays
// ECE 176
// Assignment 11
// State Machine Testbench
// statemachine_tb.v


`timescale 1ns/100ps

module statemachine_tb();

	reg clk, x, reset;
	wire out, a, b, c;
	
	statemachine U1 (.clk(clk),
						  .x(x),
						  .w(out),
						  .a(a),
						  .b(b),
						  .c(c),
						  .reset(reset)
						  );
						  
	initial begin
	
		#0 clk = 1;
		#0 x = 0;
		#0 reset = 0;
		
		#15 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 0;
		#20 x = 0;
		
		
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
        
		reset = 1;
        
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
        
		reset = 0;
        
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		
		#40 $stop;
	
	end

	always
		#10 clk = ~clk;

endmodule
