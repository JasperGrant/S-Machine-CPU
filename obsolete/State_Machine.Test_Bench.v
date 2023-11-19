// State Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-07

`timescale 1ns / 1ns

module test_FSM;
    reg enable;
    reg clk;
    wire [7:0] count;

    StateMachine state_machine(
        .enable(enable),
        .clk(clk),
        .count(count)
        );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test_FSM);
        enable = 0; clk = 0;
        #5
        enable = 1;
        #5
        clk = 1;
        #5
        clk = 0;
        #5
        clk = 1;
        #5
        clk = 0;
        #5
        clk = 1;
        #5
        clk = 0;
        #5
        ;
    end

endmodule
