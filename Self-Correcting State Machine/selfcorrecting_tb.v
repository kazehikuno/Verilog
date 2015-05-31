// Christopher Hays
// ECE 176
// Assignment 12
// testbench
// selfcorrecting_tb.v

`timescale 1ns/100ps

module selfcorrecting_tb();

	reg clk, x, reset;
	wire a, b, c, d, e, f, g;
	
	selfcorrecting U1 (.clk(clk),
							 .seg_a(a),
							 .seg_b(b),
							 .seg_c(c),
							 .seg_d(d),
							 .seg_e(e),
							 .seg_f(f),
							 .seg_g(g),
							 .reset(reset),
							 .x(x)
							 );
							 
	initial begin
		#0 clk = 1;
		#0 x = 1;
		#0 reset = 1;
		
		#100 reset = 0;
		#300 x = 0;
		#15 x = 1;
		#60 x = 0;
		#15 x = 1;
		#100 $stop;
	end
	
	always
		#10 clk = ~clk;
		
endmodule
		