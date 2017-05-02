module ALU_tb;

  reg [1:0] ALUop;
  reg [15:0] A,B;
  wire [15:0] out;
  wire [2:0] sta_out;

  ALU dut(ALUop, A, B, out, sta_out);
  initial begin
  //addition of A and B
  //3+2=5
  //sta_out=000
  ALUop=2'b00; A=16'sb011; B=16'sb010;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  //subtaction of A and B
  //3-2=1
  //sta_out=000
  ALUop=2'b01;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  //AND of A and B
  //sta_out=000
  ALUop=2'b10;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  //equal to A
  //sta_out=000
  ALUop=2'b11;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  //0+0
  //sta_out=100
  ALUop=2'b0; A=16'b0; B=16'b0;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;


  //line 1 in the table. Output should be the addition of A and B
  //sta_out=011, overflow!
  ALUop=2'b00; A=16'sb0111111111111111; B=16'sb01;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  //subtaction of A and B
  //-1-2=-3
  //sta_out=010
  ALUop=2'b01; A=16'b1000000000000111; B=16'sb010;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  //AND of A and B
  //sta_out=000
  ALUop=2'b10;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  //equal to A
  //in this case, 16'b11. sta_out=010
  ALUop=2'b11;
  #100 $display("%b %d %d-> %d %b", ALUop, A, B, out, sta_out) ;
  end
endmodule
