// State Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-07

`timescale 1ns / 1ns

module test_FSM;
    reg enable, done;
    wire [7:0] count;
    wire start;

    StateMachine state_machine(
        .enable(enable),
        .done(done),
        .start(start),
        .count(count)
        );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test_FSM);
        enable = 0; done = 0;
        #5
        enable = 1;
        #4
        done = 1;
        #1
        done = 0;
        #4
        done = 1;
        #1
        done = 0;
        #4
        done = 1;
        #1
        done = 0;
        #5
        ;
    end

endmodule
