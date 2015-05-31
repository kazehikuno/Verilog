// Christopher Hays
// ECE 176
// Assignment 9
// Multiplier Controller State Machine testbench


`timescale 1ns/100ps

module control_test();

	reg clk, reset_a, start;
	reg [1:0] count;
	wire [1:0] input_sel, shift_sel;
	wire [2:0] state_out;
	wire done, clk_ena, sclr_n;

	initial begin
		#0 clk = 0;
		#0 reset_a = 0;
		#0 start = 0;
		#0 count = 0;
		
		#40 start = 1;
		#20 start = 0;
		#43 count = count+1;
		#40 count = count+1;
		#40 count = count+1;
		#40 count = count+1;
		#40 count = 0;
		
		#20 $stop;
	end
	
	
	always
		#20 clk = ~clk;

	mult_control U1 (clk, reset_a, start, count, input_sel, shift_sel, state_out, done, clk_ena, sclr_n);
endmodule
