// Christopher Hays
// ECE 176 Assignment 4
// 4x4 Multiplier
// mult4x4.v

module mult4x4 (dataa, datab, product);
	
	input [3:0] dataa, datab;
	output [7:0] product;
	reg [7:0] product;
	
	always @(dataa, datab)begin
		product <= dataa * datab;
	end
	

endmodule 