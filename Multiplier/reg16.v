// Christopher Hays
// 16-bit register with synchronous control
// reg16.v


module reg16 (input clk, clk_ena, sclr_n, input [15:0] datain, output reg [15:0] reg_out);

	always@(posedge clk)begin
		
		if (clk_ena)begin
			if (~sclr_n)
				reg_out <= 16'H0000;
			else 
				reg_out <= datain;
		end
	end

endmodule
