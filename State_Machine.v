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

module StateMachine(enable,done,start,count);
    input enable, done;	
    output start, count;	
	//reg O;	
	reg [2:0] state;

    parameter s0 = 2'b00,	                
              s1 = 2'b01,			  
	 	      s2 = 2'b10;

    always@(posedge done)	
	begin	      
		  begin		   
		    case(state)
            s0:			 
			  begin		               				
				  if(enable == 1'b1)				  
				    state <= s1;				
				  else				  
				    state <= s0;                          
			   end
			   
			s1:			 
			  begin
                  start <= 1'b1;			               	
                  count = count+1;

				  if(done == 1'b1)				  
				    state <= s1;				
				  else				  
				    state <= s2;                          
			   end
			   
			s2:			 
			  begin		 
                 start <= 1'b0;	        //reset start since we don't want it to start       				
				  if(done == 1'b1)				  
				    state <= s1;	   // If done received go back to s1		
				  else				  
				    state <= s2;       //stay in s2 if done not received                   
			   end
               endcase
		end
	end
        	
endmodule
/*
module moore_machine(clk,rst,I,O);  
    input  clk,rst,I;	
	output O;	
	reg O;	
	reg [2:0] state;
	
	parameter s0 = 3'b000,	                
              	  s1 = 3'b001,			  
	 	  s2 = 3'b010,			  
		  s3 = 3'b011,			  
		  s4 = 3'b100;
			  
	always@(posedge clk or posedge rst)	
	begin	    
	    if(rst == 1'b1)		  
		  begin		        
		    state <= s0;			
		    O  <= 1'b0;		  
		  end
		else 		  
		  begin		   
		    case(state)
			s0:			 
			  begin		               
     		      O <= 1'b0; 				
				  if(I == 1'b1)				  
				    state <= s0;				
				  else				  
				    state <= s1;                          
			   end
			   
			s1:			 
			  begin		               
     		      O <= 1'b0; 				
				  if(I == 1'b1)				  
				    state <= s2;				
				  else				  
				    state <= s1;                          
			   end
			   
			s2:			 
			  begin		               
     		      O <= 1'b0; 				
				  if(I == 1'b1)				  
				    state <= s0;				
				  else				  
				    state <= s3;                          
			   end
			   
			s3:			 
			  begin		               
     		      O <= 1'b0; 				
				  if(I == 1'b1)				  
				    state <= s4;				
				  else				  
				    state <= s1;                          
			   end
			   
			s4:			 
			  begin		               
     		      O <= 1'b1; 				
				  if(I == 1'b1)				  
				    state <= s0;				
				  else				  
				    state <= s1;                          
			   end
			endcase
		end
	end
endmodule
*/