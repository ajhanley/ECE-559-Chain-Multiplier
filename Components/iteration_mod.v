// Code your design here
module iterate(matlen,clk,reset,iw,jw,ir,jr,kr,rw);
  input[7:0] matlen;
  input clk;
  input reset;
  output [7:0] iw,jw,ir,jr,kr;
  output rw;
  reg eq;
  integer x,y,z;
  reg[7:0] count1,count2,count3;
  always @(posedge reset)begin
    count1=matlen;
    count2=0;
    count3=count2;
    for(x=matlen; x>0; x=x-1)begin
      for(y=0; y<x-1; y=y+1)begin
        for(z=y; z<x; z=z+1)begin
          //change this delay as needed to make sure its not updating too fast
          #5;
          if(z==x-1)
         	eq=1;   
          else
            eq=0;
          #5;
        end
      end
    end
    eq=0;
    
  end
  
  assign iw = y;
  assign jw = (matlen-x+y+1);
  assign ir = y;
  assign jr = (matlen-x+y+1);
  assign kr = z;
  assign rw = eq;
            
endmodule 

/*
// Code your testbench here
// or browse Examples

*/