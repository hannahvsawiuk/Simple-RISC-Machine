module datapath_tb;
  reg write, loada, loadb, asel, bsel, loadc, loads, clk;
  reg [1:0] shift, ALUop, vsel;
  reg [2:0] writenum, readnum;
  reg [15:0] sximm5, mdata, sximm8;
  reg [7:0] PC;
  wire [15:0] datapath_out;
  wire [2:0] sta;
  wire [15:0] B_out, C_out;

  datapath dut(vsel, writenum, write, readnum, loada, loadb, shift, asel, bsel, ALUop, loadc, loads, sximm5, mdata, sximm8, PC, clk, datapath_out, sta, B_out, C_out);

initial forever begin
clk = 0;
#100;
clk = 1;
#100;
end

initial begin
//***************************************************************************7(shift)+2
//Saving value 7 to R0 from mdata
mdata = 16'd7; vsel = 2'b11; writenum = 3'd0; write = 1;
#200;

//Saving value 2 to R1 by using sximm8
sximm8= 16'd2; vsel = 2'b10; writenum = 3'd1; write = 1;
#200;

//cycle one: read R0 and load it to B
readnum = 3'd0; loada = 0; loadb = 1;
#200;

//cycle two: read R1 and load it to A
readnum = 3'd1; loada = 1; loadb = 0;
#200;

//cycle three: shift B to the left by 1 to get Bin, Ain hold the value of A, 
//Add up together and store in C, if the result is 0, status will be 1
shift = 2'b01; asel = 0; bsel = 0; ALUop = 2'b00; loadc = 1; loads = 1;
#200;

//cycle four: saving the sum into R2 
vsel = 2'b00; writenum = 3'd2; write = 1;
#200;



//**************************************************************************3+9(sximm5) cycle2
//Saving value 3 to R0 from PC
PC= 8'd3; vsel = 2'b01; writenum = 3'd0; write = 1;
#200;

//cycle one: set b to sximm5 = 9
sximm5= 16'd9;
#200;

//cycle two: read R0 and load it to A
readnum = 3'd0; loada = 1; loadb = 0;
#200;

//cycle three: do not shift B, get Bin, Ain hold the value of A, 
//Add up together and store in C, if the result is 0, status will be 100
shift = 2'b00; asel = 0; bsel = 1; ALUop = 2'b00; loadc = 1; loads = 1;
#200;

//cycle four: saving the sum into R2 
vsel = 2'b00; writenum = 3'd2; write = 1;
#200;

$stop;
end
endmodule
