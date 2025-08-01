module priority_encoder (
    input  wire [3:0] D,
    output reg  [1:0] Y,
    output reg  valid
);

always @(*) begin
    if (D == 4'b0000) begin
        valid = 1'b0;
        Y = 2'bxx;
    end
    else begin
        valid = 1'b1;
        casez (D)
            4'b1???: Y = 2'b11; // D3 has highest priority
            4'b01??: Y = 2'b10; // D2
            4'b001?: Y = 2'b01; // D1
            4'b0001: Y = 2'b00; // D0
            default: Y = 2'bxx; // Should not occur
        endcase
    end
end

endmodule
