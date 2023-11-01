//Main State Machine Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-01

/*
States:
    Fetch
        Get instruction at PC (Starts at 0)
        Increment PC by 1
    Decode
        May be unecessary as it is part of Execute
    Execute
        Perform instruction
            If ALU inst update registers A, B, bits ZNC bits
            If Branch inst possibly update PC based on ZNC bits
            If LD/ST inst update register/memory based on possible immediate
            
*/

module StateMachine(

);

endmodule