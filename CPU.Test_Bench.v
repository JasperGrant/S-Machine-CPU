//CPU Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

`timescale 1ns / 1ns

module test_CPU;

    reg clk;
    reg [15:0] inst;

    reg enable;

    reg [15:0] data_in_memory;
    wire read_write_memory;
    wire [7:0] addr;

    wire [7:0] PC;

    wire [7:0] count;

    CPU CPU(
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

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test_CPU);

    #5
    enable = 1;
    //Test 1: Load value from immediate
    #5
    inst = 16'b0000010000000001;
    clk = 1;
    #5
    clk = 0;
    #5
    inst = 16'b0000110000000001;
    clk = 1;
    #5
    clk = 0;
    //Test 2: Add values of registers
    #5
    inst = 16'b0100000000000000;
    clk = 1;
    #5
    clk = 0;
    //Test 3: Subtract value of registers
    #5
    inst = 16'b0101000000000000;
    clk = 1;
    #5
    clk = 0;
    //Test 4: INC register B
    #5
    inst = 16'b0010100000000001;
    clk = 1;
    #5
    clk = 0;
    //Test 5: OR value of registers
    #5
    inst = 16'b0110000000000000;
    clk = 1;
    #5
    clk = 0;
    //Test 6: AND value of registers
    #5
    inst = 16'b0111000000000000;
    clk = 1;
    #5
    clk = 0;
    //Test 7: XOR value of registers
    #5
    inst = 16'b1000000000000000;
    clk = 1;
    #5
    clk = 0;


    end


endmodule