// Code your design here
module regFile( Ip1,

                sel_i1, 

                OpK,

                sel_oK, 

                OpJ,

                sel_oJ,  

                rst,

                clk

              );      

 
  input  [7:0]  Ip1; 

  input  [5:0]  sel_i1,

              sel_oK,

              sel_oJ; 


  

input  EN,

       clk,

       rst; 
  

  output [7:0]  OpK,

               OpJ; 

  reg  [7:0]  OpK,

             OpJ;       

  reg [7:0]  regFile [0:31]; 

  
integer i; 

wire  sen; 

assign sen = clk || rst; 

  
  
  
always @ (posedge sen) 



 begin 

  if (rst == 1) //If at reset 

   begin 

     for (i = 0; i < 32; i = i + 1) 
       
   begin
     
    regFile [i] = 32'h0; 

   end 

   	OpK = 32'h0; 

   end 
   
   

  else if (rst == 0) //If not at reset 

   begin 


      OpJ = regFile [sel_oJ]; 

      OpK = regFile [sel_oK]; 

      regFile [sel_i1] = Ip1; 

  
     


   end 
   
   	
 end

endmodule