//S-Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron B00819540 and Jasper Grant B00829263
//To use change line 13 of S_Bench.tcl from 'run 400ns' to 'run 40000ns'
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

        switch0 = 0;
        switch1 = 0;
        #20
        enable = 1;
        
        #10000
        switch0 = 1;
        switch1 = 0;
        #10000
        switch0 = 0;
        switch1 = 1;
        #10000
        switch0 = 1;
        switch1 = 1;
    end


endmodule
