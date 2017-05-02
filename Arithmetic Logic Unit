module ALU (ALUop, Ain, Bin, out, sta_out);

  input [1:0] ALUop;
  input [15:0] Ain, Bin;
  output reg [15:0] out;
  output reg [2:0] sta_out;

  wire [15:0] s;
  reg sub;
  wire overflow;
  
  //ALU substraction
  always @(*)
    case(ALUop)
	2'b01: sub=1;
	default: sub=0;
    endcase

  //if the operation is subtraction, go to Status block
  AddSub #(16) alucore(Ain, Bin, sub, s,overflow);
  //AND and =Bin logic
  always @(*) begin
    casex(ALUop)
	2'b0x: out=s;
	2'b10: out=(Ain&Bin);
        default: out=Bin;
    endcase
  end
 
  //assign the value for if result has overflow, is negative number and is zero
  always@(*) begin
    if(out==16'b0)
      sta_out[2]=1;
    else
      sta_out[2]=0;
    if(out[15]==1)
      sta_out[1]=1;
    else
      sta_out[1]=0;
    sta_out[0]= overflow;
  end
endmodule


// a full adder to detect overflow 
module AddSub(a, b, sub, s, ovf);
  parameter n=8;
  input [n-1:0] a,b;
  input sub;
  output [n-1:0]s;
  output ovf;
  wire c1, c2;
  wire ovf= c1^c2;

  Adder1 #(n-1) ai(a[n-2:0], b[n-2:0]^{n-1{sub}}, sub, c1, s[n-2:0]);
  Adder1 #(1)   as(a[n-1], b[n-1]^sub, c1, c2, s[n-1]);
endmodule

 //half adder
module Adder1(a,b,cin,cout,s);
  parameter n=8;
  input [n-1:0] a,b;
  input cin;
  output [n-1:0] s;
  output cout;
  wire [n-1:0] s;
  wire cout;

  assign {cout,s}= a+b+cin;
endmodule
