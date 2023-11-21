//Instruction Memory Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-01

`timescale 1ns / 1ns

module InstMemory(
    input [7:0] PC,
    output [15:0] inst
);

    reg [15:0] memory [255:0];
    //Where we define our code

    initial begin
        //Fill memory from instructions.txt
        $readmemb("instructions.txt",memory); //Assuming name of txt is data.txt
    end

    assign inst = memory[PC];

endmodule