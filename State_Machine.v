//Main State Machine Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

/*
States:
    S0:enable
        Set start = 0

        if Enable = 1 move to state S1
        if Enable = 0 stay at state S0

    S1:Handle
        Set start = 1
        Increment count

        If done=0 go to S2
        If done=1 stay as S1

    S2:Notdone
        Set start = 0

        If done=0 stay
        if done =1 go to S1

*/

module StateMachine(enable,clk,count);
    input enable;
    input clk;
	output reg [7:0] count;	
	//reg O;	
	reg [2:0] state;

    parameter s0 = 2'b00,	                
              s1 = 2'b01,			  
	 	      s2 = 2'b10;

	initial begin
		state = s0;
		count = 0;
	end

    always@(clk)	
	begin	      
		  begin		   
		    case(state)
            s0:			 
			  begin		               				
				if(enable == 1'b1) begin			  
					state <= s1;
				end			
				else begin				  
				    state <= s0;    
			  	end                      
			   end
			   
			s1:			 
			  begin		               	
                  count = count+1;
				  if(clk == 1'b1) begin			  
				    state <= s1;
				  end			
				  else begin
				    state <= s2;
				  end                    
			   end
			   
			s2:			 
			  begin		      				
				  if(clk == 1'b1) begin			  
				    state <= s1;	   // If clk received go back to s1
				  end	
				  else begin
				    state <= s2;       //stay in s2 if clk not received  
				  end                 
			   end
               endcase
		end
	end
        	
endmodule