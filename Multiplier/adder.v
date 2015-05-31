// Christopher Hays
// 16-bit adder
// adder.v

`timescale 1ns/100ps

module adder (dataa, datab, sum);
	input [15:0] dataa;
	input [15:0] datab;
	output [15:0] sum;
	assign sum = (dataa + datab);
endmodule 
