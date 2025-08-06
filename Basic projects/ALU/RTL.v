module alu_16op #(
    parameter IN_WIDTH  = 8,
    parameter OUT_WIDTH = 16,

    // Arithmetic Command Codes
    parameter CMD_ADD     = 8'b00000000,
    parameter CMD_SUB     = 8'b00000001,
    parameter CMD_MUL     = 8'b00000010,
    parameter CMD_DIV     = 8'b00000011,
    parameter CMD_INC     = 8'b00000100,
    parameter CMD_DEC     = 8'b00000101,
    parameter CMD_MOD     = 8'b00000110,
    parameter CMD_LT      = 8'b00000111,

    // Logic Command Codes
    parameter CMD_AND     = 8'b10000000,
    parameter CMD_OR      = 8'b10000001,
    parameter CMD_XOR     = 8'b10000010,
    parameter CMD_NOT     = 8'b10000011,
    parameter CMD_LSH     = 8'b10000100,
    parameter CMD_RSH     = 8'b10000101,
    parameter CMD_EQ      = 8'b10000110,
    parameter CMD_NEQ     = 8'b10000111
)(
    input  wire [IN_WIDTH-1:0] a_in,
    input  wire [IN_WIDTH-1:0] b_in,
    input  wire [7:0]          command_in,
    input  wire                oe,
    output reg  [OUT_WIDTH-1:0] alu_out
);

    always @(*) begin
        if (oe) begin
            case (command_in)
                CMD_ADD:  alu_out = a_in + b_in;
                CMD_SUB:  alu_out = a_in - b_in;
                CMD_MUL:  alu_out = a_in * b_in;
                CMD_DIV:  alu_out = (b_in != 0) ? a_in / b_in : 16'hXXXX;
                CMD_INC:  alu_out = a_in + 1;
                CMD_DEC:  alu_out = a_in - 1;
                CMD_MOD:  alu_out = {8'b0, a_in % b_in};
                CMD_LT:   alu_out = {8'b0, (a_in < b_in)};

                CMD_AND:  alu_out = {8'b0, a_in & b_in};
                CMD_OR:   alu_out = {8'b0, a_in | b_in};
                CMD_XOR:  alu_out = {8'b0, a_in ^ b_in};
                CMD_NOT:  alu_out = {8'b0, ~a_in};
                CMD_LSH:  alu_out = {8'b0, a_in << 1};
                CMD_RSH:  alu_out = {8'b0, a_in >> 1};
                CMD_EQ:   alu_out = {8'b0, (a_in == b_in)};
                CMD_NEQ:  alu_out = {8'b0, (a_in != b_in)};
                
                default:  alu_out = 16'hXXXX;
            endcase
        end else begin
            alu_out = {OUT_WIDTH{1'bz}}; // High impedance when OE is low
        end
    end

endmodule
