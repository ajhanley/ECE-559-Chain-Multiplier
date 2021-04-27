// Code your design here
module Dimensional_Matrix( Ip1,
  count_out, 
  OpK,
  sel_oK, 
  OpJ,
  sel_oJ,  
  rst,
  data_in,
  clk,
  len_matrix
);      

input  [7:0]  Ip1; 
input  [4:0]  sel_oK, sel_oJ; 

input  clk, data_in, rst; 
output [7:0]  OpK, OpJ, count_out, len_matrix; 
  
reg  [7:0]  OpK, OpJ;       
reg [7:0]  regFile [0:31]; 
  
reg [7:0] count_out_temp;
reg [7:0] len_matrix_temp;
  
integer i; 
wire  sen; 
assign sen = clk || rst; 

always @ (posedge sen) 
  begin 
    if (rst == 1) //If at reset 
      begin 
        for (i = 0; i < 32; i = i + 1) 
          begin
            regFile [i] = 8'h0; 
          end 
          OpK = 8'h0; 
      end 

    else if (rst == 0) //If not at reset 
      begin 
        if (data_in == 1)
          begin
            regFile [count_out] = Ip1;
            count_out_temp = count_out + 1;
          end 

        else
          begin
            len_matrix_temp = count_out - 1;
            count_out_temp = 8'h0;
            OpJ = regFile [sel_oJ]; 
            OpK = regFile [sel_oK]; 
          end 
      end 
  end
  
    assign count_out = count_out_temp;
    assign len_matrix = len_matrix_temp;

endmodule

//Testbench/////////////////////////////////////////////////


// Code your testbench here
// or browse Examples
//`timescale 1ns / 1ps

module Dimensional_Matrix_tb;

 // Inputs
reg [7:0] Ip1;
reg [4:0] sel_oK;
reg [4:0] sel_oJ;
reg rst;
reg data_in;
reg clk;

 // Outputs
wire [7:0] OpJ;
wire [7:0] OpK;
wire [7:0] len_matrix;
wire [7:0] count_out;
  
 // Instantiate the Unit Under Test (UUT)
Dimensional_Matrix uut (
  .Ip1(Ip1), 
  .count_out(count_out), 
  .OpJ(OpJ), 
  .sel_oJ(sel_oJ), 
  .OpK(OpK), 
  .sel_oK(sel_oK), 
  .data_in(data_in),
  .rst(rst), 
  .clk(clk),
  .len_matrix(len_matrix)
);

always #10 clk = ~clk;

  initial begin
   
    $monitor(" Ip1 = %0d OPJ = %0d OPK = %0d count_out = %0d sel_oJ = %0d sel_oK = %0d  reset = %0d", Ip1, OpJ, OpK, count_out, sel_oJ, sel_oK, rst);
   
  // Initialize Inputs

  Ip1  = 8'b0;
  sel_oJ  = 5'b0;
  sel_oK  = 5'b0;
  rst  = 1'b1;
  clk  = 1'b0;
  data_in  = 1'b0;

  // Wait 100 ns for global reset to finish

  #100;        

  // Add stimulus here

  rst  = 1'b0;
  #20;
	//rst  = 1'b1;
  data_in  = 1'b0;
  Ip1  = 8'b00010001; //input 17 to 0

  #20;
  data_in  = 1'b1;
  Ip1  = 8'b00100000; // 32
    
  #20;
  data_in  = 1'b1;
  Ip1  = 8'b00100000; // 32
   
    
  #20;
  data_in  = 1'b1;
  Ip1  = 8'b00100000; // 32
    
  #20;
  data_in  = 1'b0;
  sel_oJ  = 5'h5;

  sel_oK  = 5'h1;
  #20;
  $finish;
 end 

endmodule
