//ALU Test Bench Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-10-31


module test;
    reg [15:0] inst;

    reg [15:0] register_A_in;
    reg [15:0] register_B_in;
    reg Z_in;
    reg N_in;
    reg C_in;

    wire [15:0] register_A_out;
    wire [15:0] register_B_out;
    wire Z_out;
    wire N_out;
    wire C_out;

    ALU alu(
        .inst(inst),

        .register_A_in(register_A_in), 
        .register_B_in(register_B_in),
        .Z_in(Z_in),
        .N_in(N_in),
        .C_in(C_in),

        .register_A_out(register_A_out),
        .register_B_out(register_B_out),
        .Z_out(Z_out),
        .N_out(N_out),
        .C_out(C_out)
        );

    initial begin
      $dumpfile("wave.vcd");
      $dumpvars(0, test);

      //Test 1: Adding 1 + 1
      inst = 16'b0100000000000000; register_A_in = 1; register_B_in = 1; display;
      //Test 2: Subtracting 1 - 1
      inst = 16'b0101000000000000; register_A_in = 1; register_B_in = 1; display;
      //Test 3: Shift right 1 once
      inst = 16'b1001000000000000; register_A_in = 2; display;
    end
    

    task display;
    #1 $display("Operation:%0h, Register A in:%0h, Register B in:%0h, ZNC in: %0h%0%0h, Register A out:%0h, Register B out:%0h, ZNC out: %0h%0%0h", inst, register_A_in, register_B_in, Z_in, N_in, C_in, register_A_out, register_B_out, Z_out, N_out, C_out);
    endtask

endmodule
