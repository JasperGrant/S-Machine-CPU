//Inst Interpreter Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-10-31


module test;
    reg [15:0] inst;
    reg start;

    reg [15:0] data_in_memory;
    wire read_write_memory;
    wire [15:0] data_out_memory;
    wire [7:0] addr;

    wire done;
    wire [7:0] PC;

    InstInterpreter interpreter(
        .inst(inst),

        .data_in_memory(data_in_memory),
        .read_write_memory(read_write_memory),
        .data_out_memory(data_out_memory),
        .addr(addr),

        .done(done),
        .PC(PC)

        );

    initial begin
      $dumpfile("wave.vcd");
      $dumpvars(0, test);

      //Test 1: Load value from immediate
      #5
      inst = 16'b0000010000000001; start = 1;
      #1
      start = 0;
      #5
      inst = 16'b0000110000000001; start = 1;
      #1
      start = 0;
      //Test 2: Add values of registers
      #5
      inst = 16'b0100000000000000; start = 1;
      #1
      start = 0;
      //Test 3: Subtract value of registers
      #5
      inst = 16'b0101000000000000; start = 1;
      #1
      start = 0;
      //Test 4: INC register B
      #5
      inst = 16'b0010100000000001; start = 1;
      #1
      start = 0;
      //Test 5: OR value of registers
      #5
      inst = 16'b0110000000000000; start = 1;
      #1
      start = 0;
      //Test 6: AND value of registers
      #5
      inst = 16'b0111000000000000; start = 1;
      #1
      start = 0;
      //Test 7: XOR value of registers
      #5
      inst = 16'b1000000000000000; start = 1;
      #1
      start = 0;
      #5
      ;
    
      
    end
    

    task display;
    #1 $display("Inst: %0h, start: %0h, done: %0h, PC: %0h", inst, start, done, PC);
    endtask

endmodule
