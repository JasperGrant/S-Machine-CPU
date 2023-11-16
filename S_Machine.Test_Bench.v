//S-Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

`timescale 1ns / 1ns

module test_S_Machine;
    reg enable;
    wire [7:0] count;

    SMachine smachine(
        .enable(enable),
        .count(count)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test_S_Machine);

    #1
    enable = 1;
    #299
    ;
    end


endmodule
