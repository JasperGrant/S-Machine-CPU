//S-Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron B00819540 and Jasper Grant B00829263
//2023-11-07

`timescale 1ns / 1ns

module test_S_Machine;
    reg clk;
    reg enable;
    reg switch0;
    reg switch1;
    wire led0;
    wire led1;

    SMachine smachine(
        .clk(clk),
        .enable(enable),
        .led0(led0),
        .led1(led1),
        .switch0(switch0),
        .switch1(switch1)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        $dumpfile("wave.vcd");
        $dumpvars(0, test_S_Machine);

        //Test 0: Nothing happens when enable is off
        #20
        enable = 1;
        

        #20
        enable = 1;
        #100
        switch0 = 1;
        #100
        switch0 = 0;
        //Test 1: Load value from immediate (2)
        //Test 2: Add values of registers
        //Test 3: Subtract value of registers
        //Test 4: INC register B
        //Test 5: OR value of registers
        //Test 6: AND value of registers
        //Test 7: XOR value of registers
        //Test 8: Store value of register B in 01010101
        //Test 9: Load value of 01010101 into register A
        //Test 10: SHR
        //Test 11: EXCH
        //Test 12: CMP (3 lines)
        //Test 13: MOV
        //Test 14: SET
        //Test 15: CLR
        //Test 16: BR
    end


endmodule
