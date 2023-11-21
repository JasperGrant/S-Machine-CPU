//Data Memory Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-01

`timescale 1ns / 1ns

module DataMemory(
    input clk,
    input read_write,
    input [15:0] data_in_memory,
    input [8:0] addr,
    input switch,
    output reg [15:0] data_out_memory,
    output led
);

    reg [15:0] memory [511:0];

    always@(addr, read_write) begin
        memory[4][0] = switch;
        if(read_write == 1'b0) begin
            data_out_memory = memory[addr];
        end
        if(read_write == 1'b1) begin
            memory[addr] = data_in_memory;
        end
    end

    //Devices Assignments
    assign led = memory[0][0];


endmodule