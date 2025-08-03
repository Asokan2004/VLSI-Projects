module siso (
    input clk,
    input reset,
    input serial_in,
    output serial_out
);
    reg [3:0] temp;

    always @(posedge clk ) begin
        if (reset)
            temp <= 4'b0000;
        else
            temp <= {temp[2:0], serial_in};
    end

    assign serial_out = temp[3];

endmodule
