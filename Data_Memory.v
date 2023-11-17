//Data Memory Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-01

`timescale 1ns / 1ns

module DataMemory(
    input clk,
    input read_write,
    input [15:0] data_in_memory,
    input [7:0] addr,
    output reg [15:0] data_out_memory
);

    reg [15:0] memory [255:0];

    always@(addr, read_write) begin
        if(read_write == 1'b0) begin
            data_out_memory = memory[addr];
        end
        if(read_write == 1'b1) begin
            memory[addr] = data_in_memory;
        end
    end


endmodule