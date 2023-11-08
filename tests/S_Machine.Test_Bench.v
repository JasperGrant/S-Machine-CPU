//S-Machine Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00819540, B00829263 
//2023-11-07

module test;
    reg enable;
    wire [7:0] count;

    SMachine smachine(
        .enable(enable),
        .count(count)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test);

    #1
    enable = 1;
    #20
    ;
    end


endmodule
