//Instruction Memory Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-01

module InstMemory(
    input clk,
    input [7:0] addr,
    output [15:0] data_out
);

    reg [15:0] memory [255:0];
    //Where we define our code
    memory[0] = 16'b0000010000000001;
    memory[1] = 16'b0000110000000001;
    memory[2] = 16'b0100000000000000;
    memory[3] = 16'b0101000000000000;
    memory[4] = 16'b0010100000000001;
    memory[5] = 16'b0110000000000000;
    memory[6] = 16'b0111000000000000;
    memory[7] = 16'b1000000000000000;

    always@(posedge clk, addr) begin
        data_out = memory[addr];
    end

endmodule