// Code your design here
module iterate(matlen,clk,reset,iw,jw,ir,jr,kr,rw);
  input[7:0] matlen;
  input clk;
  input reset;
  output [7:0] iw,jw,ir,jr,kr;
  output rw;
  reg eq;
  integer x,y,z;
  reg[7:0] iout,jout;
  reg[7:0] count1,count2,count3;
  always @(posedge reset)begin
    count1=matlen;
    count2=0;
    count3=count2;
    eq=0;
    for(x=matlen; x>0; x=x-1)begin
      for(y=0; y<x; y=y+1)begin
        for(z=y; z<matlen-x+y; z=z+1)begin
          //change this delay as needed to make sure its not updating too fast
          #1000;
          if(z==matlen-x+y-1)begin
         	eq=1;  
          end
          else
            eq=0;
          #10;
          eq=0;
        end
      end
    end
    eq=0;
    y=0;
    x=0;
    z=0;
    
  end
  
  assign iw = y;
  assign jw = (matlen-x+y);
  assign ir = y;
  assign jr = (matlen-x+y);
  assign kr = z;
  assign rw = eq;
            
endmodule 

/*
module tb();
  reg[7:0] matlen;
  reg clk,rst;
  wire[7:0]iw,jw,ir,jr,kr;
  wire rw;
  iterate loop(matlen,clk,rst,iw,jw,ir,jr,kr,rw);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    matlen=10;
    rst=0;
    #5;
    rst=1;
    #100;
    $finish;
  end
endmodule

    
*/