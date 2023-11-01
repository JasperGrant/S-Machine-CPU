//ALU Implementation for S-Machine CPU
//By Duncan Cameron and Jasper Grant
//B00829263
//2023-10-31

module ALU (
    input [15:0] inst,
    input [15:0] register_A_in,
    input [15:0] register_B_in,
    input Z_in,
    input N_in,
    input C_in,
    output reg [15:0] register_A_out,
    output reg [15:0] register_B_out,
    output reg Z_out,
    output reg N_out,
    output reg C_out
);

    reg [15:0] temp;

    reg [7:0] carry_matrix = 8'b00101011;// TODO: Could this be a parameter?

    //On every instruction input change decide which logic should be followed or whether ALU should not be used
    always @(inst) begin
        case(inst[15:12])
            4'b0010: //INC instruction
            begin
                //TODO: check if 2s complement is needed to handle negatives
                if(inst[11]) begin
                    register_B_out = register_B_in + inst[7:0];
                end
                else begin
                    register_A_out = register_A_in + inst[7:0];
                end
                //Standard set ZNC bits
                Z_out = register_A_out == 0;
                N_out = register_A_out[15];
                C_out = carry_matrix[{register_A_in[15], register_B_in[15], register_A_out[15]}];
            end
            4'b0100: //ADD instruction
            begin
                register_A_out = register_A_in + register_B_in;
                //Standard set ZNC bits
                Z_out = register_A_out == 0;
                N_out = register_A_out[15];
                C_out = carry_matrix[{register_A_in[15], register_B_in[15], register_A_out[15]}];
            end
            4'b0101: //SUB instruction
            begin
                register_A_out = register_A_in - register_B_in;
                //Standard set ZNC bits
                Z_out = register_A_out == 0;
                N_out = register_A_out[15];
                C_out = carry_matrix[{register_A_in[15], register_B_in[15], register_A_out[15]}];
            end
            4'b0110: //OR instruction
            begin
                register_A_out = register_A_in | register_B_in;
                //Standard set ZNC bits
                Z_out = register_A_out == 0;
                N_out = register_A_out[15];
                C_out = carry_matrix[{register_A_in[15], register_B_in[15], register_A_out[15]}];
            end
            4'b0111: //AND instruction
            begin
                register_A_out = register_A_in & register_B_in;
                //Standard set ZNC bits
                Z_out = register_A_out == 0;
                N_out = register_A_out[15];
                C_out = carry_matrix[{register_A_in[15], register_B_in[15], register_A_out[15]}];
            end
            4'b1000: //XOR instruction
            begin
                register_A_out = register_A_in ^ register_B_in;
                //Standard set ZNC bits
                Z_out = register_A_out == 0;
                N_out = register_A_out[15];
                C_out = carry_matrix[{register_A_in[15], register_B_in[15], register_A_out[15]}];
            end
            4'b1001: //SHR instruction
            begin
                //Carry bit recieves value of reg_A[0], other bits remain the same
                C_out = register_A_in[0];
                Z_out = Z_in;
                N_out = N_in;
                //Add 0 as [15] and then put digits 15-1 into spots 14-0
                register_A_out = {1'b0, register_A_in[15:1]};
            end
            4'b1010: //MOV instruction
            begin
                //Move register A to B
                register_B_out = register_A_in;
                //Status bits remain the same
                Z_out = Z_in;
                N_out = N_in;
                C_out = C_in;
            end
            4'b1011: //EXCH instruction
            begin
                //A and B register values are swapped. No temp reg needed due to seperate registers for in and out
                register_A_out = register_B_in;
                register_B_out = register_A_in;
                //Status bits remain the same
                Z_out = Z_in;
                N_out = N_in;
                C_out = C_in;
            end
            4'b1100: //CMP instruction
            begin
                //Perform subtraction with discarded output
                temp = register_A_in - register_B_in;
                //Standard set ZNC bits
                Z_out = temp == 0;
                N_out = temp[15];
                C_out = carry_matrix[{register_A_in[15], register_B_in[15], temp[15]}];
            end
            4'b1101: //SET instruction
            begin
                //Set bits based on set bits in inst
                Z_out = inst[10] ? 1 : Z_in;
                N_out = inst[9] ? 1 : N_in;
                C_out = inst[8] ? 1 : C_in;
            end
            4'b1110: //CLR instruction
            begin
                //Clear bits based on set bits in inst
                Z_out = inst[10] ? 0 : Z_in;
                N_out = inst[9] ? 0 : N_in;
                C_out = inst[8] ? 0 : C_in;
            end
            default: //Any other instruction that does not use the ALU
            begin
                //Keep both registers and all three bits the same
                register_A_out = register_A_in;
                register_B_out = register_B_in;
                Z_out = Z_in;
                N_out = N_in;
                C_out = C_in;
            end
        endcase
    end
    
endmodule