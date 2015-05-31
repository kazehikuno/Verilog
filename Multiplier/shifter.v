// Christopher Hays
// ECE 176
// Shifter
// shifter.v


module shifter(inp, shift_cntrl, shift_out);

	input [7:0] inp;
	input [1:0] shift_cntrl;
	output reg [15:0] shift_out;

	always @(inp, shift_cntrl) begin
	
        if (shift_cntrl == 0 || shift_cntrl == 3)
            shift_out = {8'H00, inp};
        else if (shift_cntrl == 1)
            shift_out = {4'H0, inp, 4'H0};
        else
            shift_out = {inp, 8'H00};
		
	end


endmodule


