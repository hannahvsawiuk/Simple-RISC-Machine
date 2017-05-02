module Shifter(shift, in, out);

  input [1:0] shift;
  input [15:0] in;
  output reg [15:0] out;
  
  //logic from the table. No modification is done when shift = 00; shift to left 1 bit when shift = 01; shift to right 1 bit when shift = 10;
  //shift the right 1 bit and the previous LSB becomes current MSB when shift = 11
  always @(*) begin
    if(shift==2'b00)
      out = in;
    else if(shift==2'b01)
      out = in << 1;
    else if(shift==2'b10)
      out = in >> 1;
    else
      out= {in[0],in[15:1]};
  end 
endmodule

