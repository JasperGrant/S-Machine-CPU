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

    always@(posedge clk) begin
        data_out = memory[addr];
    end

endmodule