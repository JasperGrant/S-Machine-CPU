//Main State Machine Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

/*
States:
    S0:Reset
        Reset everything 
        bring PC to 0
        Set Start = 0
        
    S1:Handle
        Set Start = 1

        If done=0 go to S2
        If done=1 stay as S1

    S2:Notdone
        Set Start = 0

        If done=0 stay
        if done =1 go to S1

*/

module StateMachine(
    input  clk,rst,I;	
	output O;	
	reg O;	
	reg [2:0] state;

);

    


endmodule

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