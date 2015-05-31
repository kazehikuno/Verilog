// Christopher Hays
// ECE 176 
// Seven segment display
// seven_segment_cntrl.v

module seven_segment_cntrl(in, seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g);
  
  input [2:0] in;
  output seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g;
  
  reg [6:0] out;
  always @(*)begin
    case (in)
      0 : out = 7'b1111110;
      1 : out = 7'b0110000;
      2 : out = 7'b1101101;
      3 : out = 7'b1111001;
      4 : out = 7'b0110011;
      5 : out = 7'b1011011;
      6 : out = 7'b1011111;
      7 : out = 7'b1110000;
      default : out = 7'b1001111;
    endcase
  end
  
  assign {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} = out;
  
endmodule
