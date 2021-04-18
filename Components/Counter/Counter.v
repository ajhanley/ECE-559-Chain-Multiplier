module counter(input data_in, input clk, output reg[4:0] count_out, output reg[4:0] len_matrix);

  always @ (posedge clk)
  begin
    if (~data_in)
      begin
        len_matrix = count_out - 1;
    	count_out = 0;
      end
    else
       count_out <= count_out + 1;
  end 

endmodule



module tb_counter;
  reg clk;
  reg data_in;
  wire [4:0] count_out;
  wire [4:0] len_matrix;
  
  counter c0 ( .clk (clk),
              .data_in (data_in),
              .count_out (count_out),
             .len_matrix (len_matrix));
  

  always @(posedge clk or negedge clk)
    $display("clock: %b data_in: %d out: %b len_matrix: %b", clk, data_in, count_out, len_matrix);
  always #5 clk = ~clk;
  
  initial begin
    
   	// 3 input matrix length
    
    clk <= 0;
    data_in <= 0; 
    #5;
    data_in <= 1; 
    #10;
    data_in <= 1; 
    #10;
    data_in <= 1; 
    #10;
    data_in <= 1; 
    #10;
    data_in <= 0; // data 0 signals finish input
    #20 $finish;	// read the data 5-10 sec afterwards
    
  end
endmodule