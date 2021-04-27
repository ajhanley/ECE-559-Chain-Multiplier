module iterate(matlen,clk,iw,jw,ir,jr,kr,rw);
  input[7:0] matlen;
  input clk;
  output [7:0] iw,jw,ir,jr,kr;
  reg[7:0] i,j;
  reg[7:0] count1,count2,count3;
  reg ld1,ld2,ld3;
  reg clk1,clk2,clk3;
  reg setup;
  
  
  downCount loop1(matlen,ld1,clk1,count1);
  upCount loop2(count1,ld2,clk2,count2);
  upCountInit loop3(matlen-count1+count2,count2,ld3,clk3,count3);
  
  always @(posedge clk)
    begin
      if(setup)
        begin
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
        end
      if(!kready)begin
        
      end
      
    end
assign ir = y;
assign jr = matlen-count1+count2;
assign kr = count3;
assign iw = y;
assign jw =  matlen-count1+count2;

  
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
      if(count==0)
        finished =1;
      else
        finished=0;
    end
  assign qd = count;
  
endmodule
