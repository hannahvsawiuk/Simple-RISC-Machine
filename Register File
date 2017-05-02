//decoder
module Dec(a,b);

parameter n=2;
parameter m=4;

input [n-1:0] a;
output [m-1:0] b;

wire [m-1:0] b = 1 << a;
endmodule


//state machine
module vDFF (clk, in, out);

parameter n = 16;
input clk;
input [n-1:0] in;
output [n-1:0 ] out;
reg [n-1:0] out;

//push the value of out to in at the rising edge of the clock
always@(posedge clk)
  out = in;
endmodule

//Register with load enable circuit
module RLEC (in, load, clk, out);

parameter n = 16;
input clk;
input load;
input [n-1:0] in;
output [n-1:0] out;

wire[n-1:0] next_state;

assign next_state = load ? in : out; //multiplexer on choosing in or out

vDFF #(n) STATE(clk, next_state, out);  //instantiate the state machine

endmodule

module Mux8 (a7, a6, a5, a4, a3, a2, a1, a0, s, b);
parameter k = 16;
input [k-1:0] a7, a6, a5, a4, a3, a2, a1, a0;
input [7:0] s;
output [k-1:0] b;

wire [15:0] b = ({k{s[0]}}&a0)|
                ({k{s[1]}}&a1)|
                ({k{s[2]}}&a2)|
                ({k{s[3]}}&a3)|
                ({k{s[4]}}&a4)|
                ({k{s[5]}}&a5)|
                ({k{s[6]}}&a6)|
                ({k{s[7]}}&a7);


endmodule

module regfile (clk, data_in, writenum, write, readnum, data_out);

input [15:0] data_in;
input [2:0] writenum, readnum;
input clk, write;
output [15:0] data_out;

wire [7:0] decwrite, decread;
wire [127:0] read;
wire [7:0] load = ({8{write}}& decwrite); //decide which slot to save to

//instantiate the decoder
Dec #(3,8) WRITING(writenum, decwrite);
Dec #(3,8) READING(readnum, decread);

//instantiate R0--R7
RLEC #(16) R7( data_in, load[7], clk, read[15:0]);
RLEC #(16) R6( data_in, load[6], clk, read[31:16]); 
RLEC #(16) R5( data_in, load[5], clk, read[47:32]);
RLEC #(16) R4( data_in, load[4], clk, read[63:48]);
RLEC #(16) R3( data_in, load[3], clk, read[79:64]);
RLEC #(16) R2( data_in, load[2], clk, read[95:80]);
RLEC #(16) R1( data_in, load[1], clk, read[111:96]);
RLEC #(16) R0( data_in, load[0], clk, read[127:112]);

//select the data to output
Mux8 #(16) OP(read[15:0], read[31:16], read[47:32], read[63:48], read[79:64], read[95:80], read[111:96], read[127:112], decread, data_out);

endmodule
