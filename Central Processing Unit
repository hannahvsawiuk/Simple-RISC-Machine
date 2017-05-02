module CPU(reset, clk, datapath_out, sta);
  input reset, clk;
  output [15:0] datapath_out;
  output [2:0] sta;

  wire [2:0] opcode;
  wire [1:0] op;
  wire [2:0] cond;
  wire loadir, loadpc, msel, mwrite, write, asel, bsel, loada, loadb, loadc, loads, execb;
  wire [2:0] nsel;
  wire [1:0] shift, ALUop, vsel;
  wire [2:0] writenum, readnum;
  wire [15:0] sximm5, mdata, sximm8;
  wire [7:0] PC;
  wire [15:0] B_out, C_out;
  wire [15:0] IR_result;
 // instantiate all modules in CPU.
  controller CONTROLLER(clk, reset, opcode, op, loadir, loadpc, msel, mwrite, nsel, vsel, write, loada, loadb, loadc, loads,asel, bsel, execb);//instantiate controller module
  datapath DATAPATH(vsel, writenum, write, readnum, loada, loadb, shift, asel, bsel, ALUop, loadc, loads, sximm5, mdata, sximm8, PC, clk,  datapath_out, sta, B_out, C_out);//instantiate datapath module
  stage1 STAGE1(clk, loadpc, reset, B_out, C_out, msel, mwrite, loadir,   mdata, IR_result, sta, cond, execb, sximm8[7:0], PC);//instantiate stage1 module
  decoder DECODER(IR_result, nsel, ALUop, sximm5, sximm8, shift, readnum, writenum, opcode, op, cond);//instantiate decoder module

endmodule
