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
    input switch0,
	input switch1,
    output reg [15:0] data_out_memory,
    output led0,
	output led1
);

    reg [15:0] memory [511:0];

    //Switches default to 0
    initial begin
        memory[4] = 16'b0;
		memory[5] = 16'b0;
    end

    always@(addr, read_write) begin

        //Input Device Assignments
        memory[4] = switch0;
        memory[5] = switch1;

        if(read_write == 1'b0) begin
            data_out_memory = memory[addr];
        end
        if(read_write == 1'b1) begin
            memory[addr] = data_in_memory;
        end
    end

    //Output Device Assignments
    assign led0 = memory[0];
	assign led1 = memory[1];


endmodule