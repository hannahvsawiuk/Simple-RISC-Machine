module CPU_tb;
  reg clk,reset;
  wire [15:0] datapath_out;
  wire [2:0] sta;

  //controller DUT(clk, reset, opcode, op, loadir, loadpc, msel, mwrite, nsel, vsel, write, loada, loadb, loadc, loads,asel, bsel);
  CPU DUT(reset, clk, datapath_out, sta);
  initial forever begin//instantiate clk
  clk=1'b0;
  #10;
  clk=1'b1;
  #10;
  end

  //instructions are written in data.txt.
  //in this case, we have 2+(LSL 7). The expected output is 16
  initial begin
  reset=1; //reset at the beginnig
  #15;
  reset=0;
  #5000
  $stop;
  end

endmodule
