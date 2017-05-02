module decoder(in, nsel, ALUop, sximm5, sximm8, shift, readnum, writenum, opcode, op, cond);
  input [15:0] in;
  input [2:0] nsel;
  output [1:0] ALUop, shift, op;
  output [15:0] sximm5, sximm8;
  output [2:0] readnum, writenum, opcode, cond;
  reg [2:0] readnum, writenum;
  reg [15:0]sximm5,sximm8;

  wire [4:0] imm5;
  wire [7:0] imm8;
  wire [2:0] Rn,Rd,Rm;

  assign ALUop = in[12:11];//ALuop is the pos 12 and 11 of the input

  assign imm5 = in[4:0];//extend the signal in[4:0] to output a 16-bit signal(sximm5)
  always @(*)
    case(imm5[4])
      1'b1: sximm5={11'b11111111111,imm5};//extend a negative number
      default: sximm5={11'b0,imm5};//extend a positive number
    endcase
  
  assign imm8 = in [7:0];
  always @(*)//extend the signal in[7:0] to output a 16-bit signal(sximm8)
    case (imm8[7])
      1'b1: sximm8={8'b11111111,imm8};//extend a negative number
    default:sximm8={8'b0,imm8};//extend a positive number
    endcase

  assign shift = in[4:3];//shift is pos 4 and 3 of the input

  assign opcode = in[15:13];//opcode is from pos 15 to pos 13 of the input

  assign op = in[12:11];//op is from pos 12 to pos 13 of the input

  assign Rn=in[10:8];//select the value of readnum and writenum depending on nsel
  assign Rd=in[7:5];// 001 for Rn, 010 for Rd, 100 for Rm
  assign Rm=in[2:0];
  always @(*) 
    case(nsel)
      3'b001:{readnum,writenum}={Rn,Rn};
      3'b010:{readnum,writenum}={Rd,Rd};
      default:{readnum,writenum}={Rm,Rm};
    endcase
	
assign cond = in[10:8];

endmodule
