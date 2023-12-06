//S-Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron B00819540 and Jasper Grant B00829263 
//2023-11-07

`timescale 1ns / 1ns

module test_S_Machine_Devices;
    reg clk;
    reg enable;
    reg switch;
    wire led;

    SMachine smachine(
        .clk(clk),
        .enable(enable),
        .led(led),
        .switch(switch)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        $dumpfile("wave.vcd");
        $dumpvars(0, test_S_Machine);

        #20
        enable = 1;
        #100
        switch = 1;
        #100
        switch = 0;
    end


endmodule
