module lab7_top (KEY,CLOCK_50,LEDR);
  input [3:0] KEY;
  input CLOCK_50;
  output [9:0] LEDR; 
  

  wire [15:0] datapath_out;


  CPU  cpu(.reset        (~KEY[1]), 
           .clk          (CLOCK_50),
           .datapath_out (datapath_out),
           .sta          ()
          );

assign LEDR[0] = datapath_out[0];
assign LEDR[1] = datapath_out[1];
assign LEDR[2] = datapath_out[2];
assign LEDR[3] = datapath_out[3];
assign LEDR[4] = datapath_out[4];
assign LEDR[5] = datapath_out[5];
assign LEDR[6] = datapath_out[6];
assign LEDR[7] = datapath_out[7];
assign LEDR[8] = datapath_out[8];
assign LEDR[9] = datapath_out[9];


endmodule

