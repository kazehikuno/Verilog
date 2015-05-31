// Christopher Hays
// ECE 176
// Lab 10
// 8x8 Multiplier Instantiations
// lab10.v


module mult8x8 (input [7:0] dataa,
              input [7:0] datab,
              input start,
              input reset_a,
              input clk,
              output reg done_flag,			
              output reg [15:0] product8x8_out,
				  output reg seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g
              );
				  
	 wire clk_ena, sclr_n, done;
	 wire a, b, c, d, e, f, g;
	 wire [1:0] sel, shift, count;
	 wire [2:0] state_out;
	 wire [3:0] aout, bout;
	 wire [7:0] product;
	 wire [15:0] shift_out, sum, product8x8;
              
    mux4 		m1      (.mux_in_a(dataa[3:0]), 
								.mux_in_b(dataa[7:4]), 
							   .mux_sel(sel[0]), 
							   .mux_out(aout[3:0])
								);
									  
    mux4     	m2      (.mux_in_a(datab[3:0]), 
								.mux_in_b(datab[7:4]), 
								.mux_sel(sel[1]), 
								.mux_out(bout[3:0])
								);
									  
    mult4x4  	mult1   (.dataa(aout[3:0]), 
								.datab(bout[3:0]), 
								.product(product[7:0])
								);
	 
    counter    c1      (.clk(clk), 
								.aclr_n(~start), 
								.count_out(count[1:0])
								);
	 
    shifter    s1      (.inp(product[7:0]), 
								.shift_cntrl(shift[1:0]), 
								.shift_out(shift_out[15:0])
								);
	 
    adder      a1      (.dataa(shift_out[15:0]), 
								.datab(product8x8[15:0]), 
								.sum(sum[15:0])
								);
	 
    reg16      r1      (.clk(clk), 
								.sclr_n(sclr_n), 
								.clk_ena(clk_ena), 
								.datain(sum[15:0]), 
								.reg_out(product8x8[15:0])
								);
								
    mult_control    u6      (.clk(clk), 
									  .reset_a(reset_a), 
									  .start(start), 
									  .count(count[1:0]), 
									  .input_sel(sel[1:0]), 
									  .shift_sel(shift[1:0]), 
									  .state_out(state_out[2:0]), 
									  .done(done), 
									  .clk_ena(clk_ena), 
									  .sclr_n(sclr_n)
									  );
	 
    seven_segment_cntrl 	ss1 	(.in(state_out[2:0]), 
											 .seg_a(a), 
											 .seg_b(b), 
											 .seg_c(c), 
											 .seg_d(d), 
											 .seg_e(e), 
											 .seg_f(f), 
											 .seg_g(g)
											 );
    always @(posedge clk)begin
			done_flag <= done;
			product8x8_out <= product8x8;
			seg_a <= a;
			seg_b <= b;
			seg_c <= c;
			seg_d <= d;
			seg_e <= e;
			seg_f <= f;
			seg_g <= g;
	 end
    
endmodule
    