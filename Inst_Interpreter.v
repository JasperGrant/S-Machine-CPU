//Instruction Interpreter Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-10-31

module ALU (
    input [15:0] inst,
    input start,

    input [15:0] data_in_memory,
    input read_write_memory,
    output reg [15:0] data_out_memory,

    output reg done,
    output reg [7:0] PC

);

    //Declare status bits
    reg Z = 0, N = 0, C = 0;

    //Declare A and B registers
    reg [15:0] register_A = 0;
    reg [15:0] register_B = 0;

    reg [15:0] register_temp = 0;

    reg [7:0] carry_matrix = 8'b00101011;// TODO: Could this be a parameter?

    initial begin
        PC = 0;
    end

    //On every instruction input change decide which logic should be followed or whether ALU should not be used
    always @(posedge start, inst) begin
        //Clear done
        done = 0;
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
                Z = register_A == 0;
                N = register_A[15];
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

        endcase
        done = 1;
    end
    
endmodule