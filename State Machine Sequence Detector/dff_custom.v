// Christopher Hays
// ECE 176
// Assignment 11
// D Flip Flop
// dff.v

module dff_custom(input clk, dff_in, reset, output reg dff_out);

	always @(posedge clk, posedge reset)begin
	if(reset)
		dff_out = 0;
	else
		dff_out = dff_in;
	end
	
endmodule
