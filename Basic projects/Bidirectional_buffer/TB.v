`timescale 1ns / 1ps

module tb_bidir_buffer;

    reg ctrl;
    reg data_in;
    wire data_out;
    wire bus;

    // Simulate external driver when ctrl = 0 (read mode)
    reg external_drive;
    assign bus = (ctrl == 0) ? external_drive : 1'bz;

    // Instantiate the DUT (Design Under Test)
    bidir_buffer uut (
        .bus(bus),
        .data_in(data_in),
        .data_out(data_out),
        .ctrl(ctrl)
    );

    initial begin
        $display("Time\tctrl\tdata_in\texternal_drive\tbus\tdata_out");
        $monitor("%0t\t%b\t%b\t%b\t\t%b\t%b", 
                 $time, ctrl, data_in, external_drive, bus, data_out);

        // --- READ Mode ---
        ctrl = 0;        // Read from bus
        external_drive = 1;
        #10;
        external_drive = 0;
        #10;

        // --- WRITE Mode ---
        ctrl = 1;        // Drive to bus
        data_in = 1;
        #10;
        data_in = 0;
        #10;

        $finish;
    end

endmodule
