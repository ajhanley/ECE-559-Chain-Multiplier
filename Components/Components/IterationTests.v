// Code your design here
`include "Comparator.v"
module iterate2(matlen,clk,reset,iw,jw,ir,jr,kr,rw);
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
      for(y=0; y<x; y=y+1)begin
        for(z=y; z<x; z=z+1)begin
          #10;
          if(z==x-2)
         	eq=1;   
          else
            eq=0;
        end
      end
    end
    
  end
  
  assign iw = y;
  assign jw = (matlen-x+y);
  assign ir = y;
  assign jr = (matlen-x+y);
  assign kr = z;
  assign rw = eq;
            
endmodule 
    
    
module iterate(matlen,clk,reset,iw,jw,ir,jr,kr,rw);
  input[7:0] matlen;
  input clk;
  output [7:0] iw,jw,ir,jr,kr;
  output rw;
  wire[7:0] qd1,qd2,qd3;
  wire lt,eq,gt;
  reg[7:0] i,j;
  reg[7:0] count1,count2,count3;
  reg ld1,ld2,ld3, kready,c2ready,c1ready;
  reg clk1,clk2,clk3;
  reg setup;
  input reset;
  
  
  downCount loop1(matlen,ld1,clk1,qd1);
  upCount loop2(count1,ld2,clk2,qd2);
  upCountInit loop3(matlen-count1+count2,count2,ld3,clk3,qd3);
  comparator_8b c1(count3,j,eq,lt,gt);  
  always @(posedge reset)
    setup=1;
  always @(posedge clk)
    begin
    count1=qd1;
    count2=qd2;
    count3=qd3;
    j = matlen-count1+count2;
      if(setup)
        begin
          kready=0;
          c2ready=0;
          c1ready=0;
          ld1=1;
          clk1=0;
          #6;
          clk1=1;
          ld1=0;
          ld2=1;
          clk2=0;
          #6;
          clk2=1;
          ld2=0;
          ld3=1;
          clk3=0;
          #6;
          clk3=1;
          ld3=0;
          setup=0;
        end
      else begin
        if(!kready)
          begin
            clk3=1;
            #5;
            clk3=0;
            #5;
            if (matlen-count1+count2==count3)
              kready=1;
            end
          else if(!c2ready) begin
            	clk2=1;
            	#5;
            	clk2=0;
           	    ld3=1;
            	clk3=1;
            	#1;
            	clk3=0;
            	ld3=0;
            	kready=0;
            	#3;
                if(count2==count1)
                  c2ready=1;
              else if(!c1ready) begin
                 clk1=1;
                 #5;
                 clk1=0;
                ld2=1;
                clk2=1;
                #1;
                ld2=0;
                clk2=0;
                 c2ready=0;
                 #4;
                 if(count1==0)
                   c1ready=1;
             end
          end
        end
    end
      
assign ir = count2;
assign jr = j;
assign kr = count3;
assign iw = count2&eq;
assign jw =  j & eq;
assign rw = eq;
  
endmodule


module upCountInit(dmax,din,ld,clk,qd);
  input[7:0] dmax,din;
  input clk;
  input ld;
  output[7:0] qd;
  reg finished;
  reg[7:0] max,count;
  always@(posedge clk)
    begin
      if(ld)begin
        max <= dmax;
        count <= din;
        end
      if(!finished)
        count<=count+1;
        $display(count);
      if(count==max)
        finished=1;
      else
        finished=0;
    end
  assign qd =count;
endmodule



module upCount(d,ld,clk,qd);
  input[7:0] d;
  input clk;
  input ld;
  output[7:0] qd;
  reg finished;
  reg[7:0] count;
  reg[7:0] max;
  
  always@(posedge clk)
    begin
      if(ld)begin
        max<=d;
        count<=0;
        end
      if(!finished)
        count<=count+1;
      $display("Up Count = " + count);
      if(count==max)
        finished=1;
      else
        finished=0;
    end
  assign qd =count;
endmodule

module downCount(d,ld,clk,qd);
  input[7:0] d;
  input clk;
  input ld;
  output[7:0] qd;
  reg finished;
  reg[7:0] count;
  always @(posedge clk)
    begin
      if(ld)
        count<=d;
      if(!finished)
        count<=count-1;
        $display(count);
      if(count==0)
        finished =1;
      else
        finished=0;
    end
  assign qd = count;
  
endmodule
