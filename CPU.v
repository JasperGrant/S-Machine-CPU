//CPU Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

`timescale 1ns / 1ns

`include "Inst_Interpreter.v"
`include "State_Machine.v"

module CPU(
    input clk,
    input [15:0] inst,

    input enable,

    input [15:0] data_in_memory,
    output read_write_memory,
    output [7:0] addr,
    output [15:0] data_out_memory,

    output [7:0] PC,

    output [7:0] count
);

InstInterpreter interpreter(
    .clk(clk),
    .inst(inst),

    .data_in_memory(data_in_memory),
    .read_write_memory(read_write_memory),
    .data_out_memory(data_out_memory),
    .addr(addr),

    .PC(PC)
);

StateMachine fsm(
    .clk(clk),
    .enable(enable),
    .count(count)
);

endmodule