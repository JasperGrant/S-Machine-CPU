//Instruction Interpreter Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-10-31

`timescale 1ns / 1ns

module CPU (
    input [15:0] inst,
    input clk,
    input enable,

    input [15:0] data_in_memory,
    output reg read_write_memory,
    output reg [15:0] data_out_memory,
    output reg [8:0] addr,

    output reg [7:0] PC

);

    //Declare status bits
    reg Z = 0, N = 0, C = 0;

    //Declare A and B registers
    reg [15:0] register_A;
  	reg [15:0] register_B;

    reg [15:0] register_temp = 0;
    reg Execute; //temp for Branch

    reg [7:0] carry_matrix = 8'b11010100;// TODO: Could this be a parameter?

    initial begin
      	register_A = 0;
      	register_B = 0;
        PC = 0;
    end

    //On every instruction input change decide which logic should be followed
    always @(posedge clk) begin
        if(enable == 1'b1) begin
            PC = PC + 1;
            //Store backup for register A in temp
            register_temp = register_A;
        
            case(inst[15:12])
                4'b0010: //INC instruction
                begin
                    //TODO: check if 2s complement is needed to handle negatives
                    if(inst[11]) begin
                        register_B = register_B + inst[7:0];
                    end
                    else begin
                        register_A = register_A + inst[7:0];
                    end
                    //Standard set ZNC bits
                    Z = register_A == 0;
                    N = register_A[15];
                    C = carry_matrix[{register_temp[15], register_B[15], register_A[15]}];
                end
                4'b0100: //ADD instruction
                begin
                    register_A = register_A + register_B;
                    //Standard set ZNC bits
                    Z = register_A == 0;
                    N = register_A[15];
                    C = carry_matrix[{register_temp[15], register_B[15], register_A[15]}];
                end
                4'b0101: //SUB instruction
                begin
                    register_A = register_A - register_B;
                    //Standard set ZNC bits
                    Z = register_A == 0;
                    N = register_A[15];
                    C = carry_matrix[{register_temp[15], register_B[15], register_A[15]}];
                end
                4'b0110: //OR instruction
                begin
                    register_A = register_A | register_B;
                    //Standard set ZNC bits
                    Z = register_A == 0;
                    N = register_A[15];
                    C = carry_matrix[{register_temp[15], register_B[15], register_A[15]}];
                end
                4'b0111: //AND instruction
                begin
                    register_A = register_A & register_B;
                    //Standard set ZNC bits
                    Z = register_A == 0;
                    N = register_A[15];
                    C = carry_matrix[{register_temp[15], register_B[15], register_A[15]}];
                end
                4'b1000: //XOR instruction
                begin
                    register_A = register_A ^ register_B;
                    //Standard set ZNC bits
                    Z = register_A == 0;
                    N = register_A[15];
                    C = carry_matrix[{register_temp[15], register_B[15], register_A[15]}];
                end
                4'b1001: //SHR instruction
                begin
                    //Carry bit recieves value of reg_A[0]
                    C = register_A[0];
                    //Add 0 as [15] and then put digits 15-1 into spots 14-0
                    register_A = {1'b0, register_A[15:1]};
                end
                4'b1010: //MOV instruction
                begin
                    //Move register A to B
                    register_B = register_A;
                end
                4'b1011: //EXCH instruction
                begin
                    //A and B register values are swapped. Temp register is already equal to previous value of A
                    register_A = register_B;
                    register_B = register_temp;
                    //Status bits remain the same
                end
                4'b1100: //CMP instruction
                begin
                    //Perform subtraction with discarded output
                    register_temp = register_A - register_B;
                    //Standard set ZNC bits
                    Z = register_temp == 0;
                    N = register_temp[15];
                    C = carry_matrix[{register_A[15], register_B[15], register_temp[15]}];
                end
                4'b1101: //SET instruction
                begin
                    //Set bits based on set bits in inst
                    Z = inst[10] ? 1 : Z;
                    N = inst[9] ? 1 : N;
                    C = inst[8] ? 1 : C;
                end
                4'b1110: //CLR instruction
                begin
                    //Clear bits based on set bits in inst
                    Z = inst[10] ? 0 : Z;
                    N = inst[9] ? 0 : N;
                    C = inst[8] ? 0 : C;
                end
                4'b0000: //LD instruction
                begin
                    if(inst[11]) begin
                        if(inst[10]) begin
                        register_B = inst[9] ? {inst[7:0], 8'b00000000} : {8'b00000000, inst[7:0]};
                        end
                        else begin
                            //Fool with timing
                            read_write_memory = 0;
                            addr = inst[8:0];
                            #3
                            register_B = data_in_memory;
                        end
                    end
                    else begin
                        if(inst[10]) begin
                        register_A = inst[9] ? {inst[7:0], 8'b00000000} : {8'b00000000, inst[7:0]};
                        end
                        else begin
                            //Fool with timing
                            read_write_memory = 0;
                            addr = inst[8:0];
                            #3
                            register_A = data_in_memory;
                        end
                    end
                end
                4'b0001: //ST instruction
                begin
                    read_write_memory = 1;
                    addr = inst[8:0];
                    data_out_memory = inst[11] ? register_B : register_A;
                end
                4'b0011: //Transfer of control or BR instruciton
                begin
                    Execute = 0;
                    if (inst[11] == 0) begin
                        // BZ, BN, BC plus others
                        if (inst[10] == Z |
                        inst[9] == N |
                        inst[8] == C) begin
                        Execute = 1;
                        end
                        else
                        // 0 0 0 0
                        if (inst[10] == 0 &&
                            inst[9] == 0 &&
                            inst[8] == 0)begin
                            Execute = 1;
                        end
                    end
                    else begin
                        // BNZ, BNN, BNC
                        if ((inst[10] == 1 && Z == 0) |
                            (inst[9] == 1 && N == 0) |
                            (inst[8] == 1 && C == 0)) begin
                            Execute = 1;
                        end
                        // 1 1 1 1
                        if (inst[10] == 1 &&
                            inst[9] == 1 &&
                            inst[8] == 1) begin
                            Execute = 1;
                        end
                    end

                    if (Execute == 1) begin
                    PC = inst[7:0];
                    end
                end
            endcase
        end
    end
endmodule