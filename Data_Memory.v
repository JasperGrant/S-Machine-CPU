//Data Memory Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-11-01

module DataMemory(
    input clk,
    input read_write,
    input [15:0] data_in,
    input [7:0] addr,
    output [15:0] data_out
);

    reg [15:0] memory [255:0];

    always@(posedge clk) begin
        if(read_write == 0) begin
            data_out = memory[addr];
        end
        if(read_write == 1) begin
            memory[addr] = data_in;
        end
    end


endmodule