module iterate(matlen,reset,iw,jw,ir,jr,kr,rw);
  input[7:0] matlen;
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
  
  assign iw = eq & y;
  assign jw = eq & (matlen-x+y);
  assign ir = y;
  assign jr = (matlen-x+y);
  assign kr = z;
  assign rw = eq;
            
endmodule 