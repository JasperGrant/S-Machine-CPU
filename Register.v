//Register Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-01

module Register(
    input clk,
    input read_write,
    input [15:0] data_in,
    output [15:0] data_out
);

    reg [15:0] register;

    always@(posedge clk) begin
        if(read_write == 0) begin
            data_out = register;
        end
        if(read_write == 1) begin
            register = data_in;
        end
    end


endmodule