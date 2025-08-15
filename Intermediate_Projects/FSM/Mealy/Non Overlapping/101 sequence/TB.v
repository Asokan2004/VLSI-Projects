module tb;

    reg clk, reset, data_in;
    wire seq_detected;
    fsm dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .seq_detected(seq_detected)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    task apply_bit(input bit b);
        begin
            data_in = b;
            #10;
        end
    endtask
    initial begin
        reset = 1;
        data_in = 0;
        #15 reset = 0;

        // Test sequence: 1101011010110101
        apply_bit(1);
        apply_bit(1);
        apply_bit(0);
        apply_bit(1);
        apply_bit(0);
        apply_bit(1);
        apply_bit(1);
        apply_bit(0);
        apply_bit(1);
        apply_bit(0);
        apply_bit(1);
        apply_bit(1);
        apply_bit(0);
        apply_bit(1);
        apply_bit(0);
        apply_bit(1);
        #20 $finish;
    end
    initial begin
        $monitor("T=%0t | data_in=%b | state=%b | seq_detected=%b",
                 $time, data_in, dut.current_state, seq_detected);
    end
endmodule
