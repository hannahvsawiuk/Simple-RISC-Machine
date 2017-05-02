module datapath(vsel, writenum, write, readnum, loada, loadb, shift, asel, bsel, ALUop, loadc, loads, sximm5, mdata, sximm8, PC, clk, datapath_out, sta, B_out, C_out );
  input write, loada, loadb, asel, bsel, loadc, loads, clk;
  input [1:0] shift, ALUop, vsel;
  input [2:0] writenum, readnum;
  input [15:0] sximm5, mdata, sximm8;
  input [7:0] PC;
  output reg [15:0] datapath_out;
  output [2:0] sta;
  output [15:0] B_out, C_out;

  wire [15:0] data_in, data_out, A_out, B_out, shift_out, Ain, Bin, ALU_out, C_out;
  wire [2:0] sta_out;
  
  regfile register(clk, data_in, writenum, write, readnum, data_out); //instantiate the register
  morereg A(data_out, loada, clk, A_out); // instantiate the loadA
  morereg B(data_out, loadb, clk, B_out); // instantiate the loadB
  Shifter SHIFT(shift, B_out, shift_out); // instantiate shifter
  multiplexerLeft Multiplexer_A(asel, A_out, Ain); // instantiate the multiplexer A
  multiplexerRight Multiplexer_B(bsel, shift_out, sximm5, Bin); //instantiate the multiplexer B
  ALU alu(ALUop, Ain, Bin, ALU_out, sta_out); //instantiate the ALU
  status STATUS(sta_out, clk, loads, sta); // instantiate the STATUS module
  morereg C(ALU_out, loadc, clk, C_out); // instantiate the loadC
  writebackmultiplexer BACK(vsel, mdata, sximm8, {8'b0,PC}, C_out, data_in); //instantiate the big multiplexer

   //the final output value is stored in register C. We read the value from C
  always@(*)  
    datapath_out= C_out;
endmodule


module morereg(in, load, clk, out);
  input clk, load;
  input [15:0] in;
  output [15:0] out;

  //push the input value to output value at the rising edge of the clk
  RLEC A(in,load,clk,out);
endmodule


module multiplexerLeft (sel, in, out);
  input sel;
  input [15:0] in;
  output reg [15:0] out;
  
   //output = input when sel is 0; output = 0 when sel is 1
  always @(*) begin
    if (sel==0)
      out = in;
    else
      out=16'b0;
  end
endmodule

module multiplexerRight (sel, in, sximm5, out);
  input sel;
  input [15:0] in, sximm5;
  output reg [15:0] out;
  
 //output = input when sel is 0. Output = sximm5 when sel is 1
  always @(*) begin
    if (sel==0)
      out= in;
    else
      out= sximm5;
  end
endmodule

module writebackmultiplexer (vsel, mdata, sximm8, newdata, C, out);
  input [1:0] vsel;
  input [15:0] C, newdata, sximm8, mdata;
  output[15:0] out;

  wire [3:0] vsel_onehot;

  Dec #(2,4) DecodeVsel(vsel, vsel_onehot); //decoder 2 to 4
  Mux4 #(16) FourToOne(mdata, sximm8, newdata, C, vsel_onehot, out);  //instantiate the mux module
endmodule

module status( in, clk, load, out);
  input clk, load;
  input [2:0] in;
  output [2:0] out;
  
  //when the input is zero, the bit2 will be one,  when the input is a negative number, the bit1 will be one, the the input overflow, the bit0 will be one.
  RLEC #(1) zero(in[2], load, clk, out[2]);
  RLEC #(1) negative(in[1], load, clk, out[1]);
  RLEC #(1) overflow(in[0], load, clk, out[0]);

endmodule

module Mux4 (a3, a2, a1, a0, s, b);
parameter k = 16;
input [k-1:0] a3, a2, a1, a0;
input [3:0] s;
output [k-1:0] b;

wire [15:0] b = ({k{s[0]}}&a0)|
                ({k{s[1]}}&a1)|
                ({k{s[2]}}&a2)|
                ({k{s[3]}}&a3);


endmodule
