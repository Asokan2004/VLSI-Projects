`timescale 1ns / 1ps

module alu_16op_tb;

    reg [7:0] a_in, b_in;
    reg [7:0] command_in;
    reg       oe;
    wire [15:0] alu_out;

    // Instantiate with default parameters
    alu_16op dut (
        .a_in(a_in),
        .b_in(b_in),
        .command_in(command_in),
        .oe(oe),
        .alu_out(alu_out)
    );

    initial begin
        $monitor("Time=%0t | A=%0d | B=%0d | Cmd=%b | OE=%b | Out=%h", $time, a_in, b_in, command_in, oe, alu_out);
        
        // Enable output
        oe = 1;

        // Arithmetic tests
        a_in = 8'd15; b_in = 8'd10;
        command_in = dut.CMD_ADD;  #10;
        command_in = dut.CMD_SUB;  #10;
        command_in = dut.CMD_MUL;  #10;
        command_in = dut.CMD_DIV;  #10;
        command_in = dut.CMD_MOD;  #10;

        // Logic tests
        command_in = dut.CMD_AND;  #10;
        command_in = dut.CMD_OR;   #10;
        command_in = dut.CMD_XOR;  #10;
        command_in = dut.CMD_NOT;  #10;
        command_in = dut.CMD_LSH;  #10;

        // Output disable test
        oe = 0; command_in = dut.CMD_ADD; #10;

        $finish;
    end
endmodule
