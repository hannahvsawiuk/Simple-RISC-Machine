module RAM(clk, read_address, write_address, write, din, dout);
  parameter data_width = 32;
  parameter addr_width = 4;
  parameter filename = "data.txt";

  input clk;
  input [addr_width-1:0] read_address, write_address;
  input write;
  input [data_width-1:0] din;
  output [data_width-1:0] dout;
  reg [data_width-1:0] dout;

  reg[data_width-1:0] mem [2**addr_width-1:0];

  initial $readmemb(filename, mem);//Initializes memory to contents of file

  always @ (posedge clk) begin
	if (write)
	  mem[write_address] <= din;//Writes on rising edge of clock
	dout <= mem[read_address];//Read data ?delayed? 1 cycle
  end
endmodule

module stage1(clk, incp, reset, B, C, msel, mwrite, loadir, mdata, IR_result, status, cond, execb, sximm8, PC_out);
  input clk, incp, reset, msel, mwrite, loadir, execb;
  input [7:0] sximm8;
  input [15:0] B, C;
  input [2:0] status, cond;
  output [15:0] mdata;
  output [15:0] IR_result;
  output [7:0] PC_out;

  wire [7:0] msel_out, reset_out, counter_out, pcrel, loadpc_out;
  wire taken;
  wire loadpc;

  
  assign loadpc = incp || taken;
  
  //read instructions from data.txt and advance them to mdata.
  RAM #(16,8,"if.txt") STAGE1(clk, msel_out, msel_out, mwrite, B, mdata);

  //if loadpc=1, then increase the value of PC_out by 1 and push it to next cycle
  assign counter_out = incp? PC_out+1 : pcrel; // if incp = 1, increment PC, else don't increment PC;
  
  assign loadpc_out = loadpc? counter_out: PC_out; //loadpc = taken || incp
  
  //if reset=1, the address will become 0; otherwise, advance the value of counter_out
  assign reset_out = reset? 8'b0 : loadpc_out;
  
  //push the value to PC at the rising edge of clk
  vDFF #(8) PC(clk, reset_out, PC_out);
  //select the input address for RAM
  assign msel_out = msel? C[7:0] : PC_out;
  //store the instruction in IR register
  RLEC #(16) IR(mdata, loadir, clk, IR_result);
  
  branch branchu(status, cond, execb, taken); //branch unit instantiation
  
  assign pcrel = sximm8 + PC_out; //addition of sximm8 [7:0] and the current value of PC
  
 
  
endmodule
