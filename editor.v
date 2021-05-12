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
    x=0;
    y=0;
    z=0;
    for(x=0; x<31; x=x+1)begin
      for(y=0; y<31-x; y=y+1)begin
	    case(y)
		    0:begin 
			    for(z=0; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        1:begin 
			    for(z=1; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        2:begin 
			    for(z=2; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        3:begin 
			    for(z=3; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        4:begin 
			    for(z=4; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        5:begin 
			    for(z=5; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        6:begin 
			    for(z=6; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        7:begin 
			    for(z=7; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        8:begin 
			    for(z=8; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        9:begin 
			    for(z=9; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        10:begin 
			    for(z=10; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        11:begin 
			    for(z=11; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        12:begin 
			    for(z=12; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        13:begin 
			    for(z=13; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        14:begin 
			    for(z=14; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        15:begin 
			    for(z=15; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        16:begin 
			    for(z=16; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        17:begin 
			    for(z=17; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        18:begin 
			    for(z=18; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        19:begin 
			    for(z=19; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        20:begin 
			    for(z=20; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        21:begin 
			    for(z=21; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        22:begin 
			    for(z=22; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        23:begin 
			    for(z=23; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        24:begin 
			    for(z=24; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        25:begin 
			    for(z=25; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        26:begin 
			    for(z=26; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        27:begin 
			    for(z=27; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        28:begin 
			    for(z=28; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        29:begin 
			    for(z=29; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        30:begin 
			    for(z=30; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
        31:begin 
			    for(z=31; z<x; z=z+1)begin
				    #100
                    if(z==x-1)begin
        	    eq=1;
				    end
				    else
					    eq=0;
					    #10
					    eq=0;
	          end
		      end
		default:eq=0;
		endcase
	end
      end
    eq=0;
    y=0;
    x=0;
    z=0;
    
  end
  
  assign iw = y;
  assign jw = (x+y);
  assign ir = y;
  assign jr = (x+y);
  assign kr = z;
  assign rw = eq;
            
endmodule 
