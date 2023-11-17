//S-Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

`timescale 1ns / 1ns

module test_S_Machine;
    reg clk;
    reg enable;
    wire [7:0] count;

    SMachine smachine(
        .clk(clk),
        .enable(enable),
        .count(count)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test_S_Machine);

     #5
    enable = 1;
    //Test 1: Load value from immediate
    #5
    clk = 1;
    #5
    clk = 0;
    #5
    clk = 1;
    #5
    clk = 0;
    //Test 2: Add values of registers
    #5
    clk = 1;
    #5
    clk = 0;
    //Test 3: Subtract value of registers
    #5
    clk = 1;
    #5
    clk = 0;
    //Test 4: INC register B
    #5
    clk = 1;
    #5
    clk = 0;
    //Test 5: OR value of registers
    #5
    clk = 1;
    #5
    clk = 0;
    //Test 6: AND value of registers
    #5
    clk = 1;
    #5
    clk = 0;
    //Test 7: XOR value of registers
    #5
    clk = 1;
    #5
    clk = 0;
    end


endmodule
