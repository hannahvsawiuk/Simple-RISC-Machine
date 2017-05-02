module regfile_tb;
reg [2:0] writenum;
reg write;
reg [15:0]data_in;
reg clk;
reg [3:0]readnum;
wire [15:0]data_out;

regfile dut(clk, data_in, writenum, write, readnum, data_out);  //instantiate dut

initial begin
//define clock
repeat (7) begin
clk = 0;
#50;
clk = 1;
#50;
end
end

initial begin
//write 7 into R1
//write is low
write = 1'b0; writenum = 3'b001; data_in = 16'd7;readnum = 3'b001;
#100;
//write is high
write = 1'b1;
#100;//expect data_out=16'b111

//read from regfile
readnum = 3'b001;
#30 $display("%d-> %d", data_in, data_out);
#40 $display("%d-> %d", data_in, data_out);
#30;

//write 5 into R0
//write is low
write = 1'b0; writenum = 3'b000; data_in = 16'd5;
#100;
//write is high
write = 1'b1;
#100;//read from regfile
readnum = 3'b000;
#30 $display("%d-> %d", data_in, data_out);
#40 $display("%d-> %d", data_in, data_out);
#40;//expect data_out=16'b101, data_out should change immediately when we input readnum
//since the mux is purely combinational logic.

//read 7 from R1 again to make sure that the block can actually remember data
readnum = 3'b001;
#20 $display("%d-> %d", data_in, data_out);
#40 $display("%d-> %d", data_in, data_out);
#30;//expect data_out=16'b111
end
endmodule
