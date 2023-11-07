//ALU Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-10-31


module test;
    reg [15:0] inst;
    reg start;

    reg [15:0] data_in_memory;
    reg read_write_memory;
    wire [15:0] data_out_memory;

    wire done;
    wire PC;

    ALU alu(
        .inst(inst),

        .data_in_memory(data_in_memory),
        .read_write_memory(read_write_memory),
        .data_out_memory(data_out_memory),

        .done(done),
        .PC(PC)

        );

    initial begin
      $dumpfile("wave.vcd");
      $dumpvars(0, test);

      //Test 1: Adding 1 + 1
      #5
      inst = 16'b0100000000000000; start = 1; start = 0; display;
      #5
      inst = 16'b0100000000000000; start = 1; start = 0; display;
      #5
      inst = 16'b0100000000000000; start = 1; start = 0; display;
      //Test 2: Subtracting 1 - 1
      //inst = 16'b0101000000000000; display;
      //Test 3: Shift right 1 once
      //inst = 16'b1001000000000000; display;
    end
    

    task display;
    #1 $display("Inst: %0h, start: %0h, done: %0h, PC: %0h", inst, start, done, PC);
    endtask

endmodule
