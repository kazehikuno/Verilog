// Christopher Hays
// ECE 176 Fall 14
// Assignment 12
// Seven segment display controller


module sevensegment(in, a, b, c, d, e, f, g);
  
  input [2:0] in;
  output a, b, c, d, e, f, g;
  
  reg [6:0] out;
  always @(*)begin
    case (in)
      3'b000 : out = 7'b1111110;
      3'b001 : out = 7'b0110000;
      3'b010 : out = 7'b1101101;
      3'b011 : out = 7'b1111001;
      3'b100 : out = 7'b0110011;
      3'b101 : out = 7'b1011011;
      3'b110 : out = 7'b1011111;
      3'b111 : out = 7'b1110000;
      default : out = 7'b1001111;
    endcase
  end
  
  assign {a, b, c, d, e, f, g} = out;
  
endmodule
