//Top Level Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

`timescale 1ns / 1ns

`include "CPU.v"
`include "Inst_Memory.v"
`include "Data_Memory.v"

module SMachine(
    input enable,
    input clk,
    output [7:0] count
);

    wire read_write_memory;
    wire [15:0] data_in_memory;
    wire [7:0] addr;
    wire [15:0] data_out_memory;

    wire [15:0] inst;
    wire [7:0] PC;

    CPU cpu(
        .clk(clk),
        .inst(inst),
        .enable(enable),
        .data_in_memory(data_in_memory),
        .read_write_memory(read_write_memory),
        .addr(addr),
        .data_out_memory(data_out_memory),
        .PC(PC),
        .count(count)
    );

    InstMemory inst_memory(
        .inst(inst),
        .PC(PC)
    );

    DataMemory data_memory(
        .read_write(read_write_memory),
        .data_in_memory(data_out_memory),
        .data_out_memory(data_in_memory),
        .addr(addr)
    );

endmodule