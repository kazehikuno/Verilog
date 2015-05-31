// Christopher Hays
// ECE 176
// 4-bit, 2:1 multiplexer
// mux4.v

module mux4 (mux_in_a, mux_in_b, mux_sel, mux_out);

	input [3:0] mux_in_a, mux_in_b;
	input mux_sel;
	
	output [3:0] mux_out;
	reg [3:0] mux_out;
	
	always@(mux_sel, mux_in_a, mux_in_b)begin
		if (mux_sel)
			mux_out <= mux_in_b;
		else
			mux_out <= mux_in_a;
	end 
	

endmodule