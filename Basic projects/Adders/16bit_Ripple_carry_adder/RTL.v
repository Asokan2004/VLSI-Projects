 //step 1: full_adder_RTL

 module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);
    assign sum  = a ^ b ^ cin;              
    assign cout = (a & b) | (b & cin) | (a & cin); 
endmodule


 //step 2: using full_adder implement 4bit_ripple_carry_adder

module rca_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       cout
);
    wire [2:0] c;

    full_adder FA0 (.a(a[0]), .b(b[0]), .cin(cin),   .sum(sum[0]), .cout(c[0]));
    full_adder FA1 (.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
    full_adder FA2 (.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
    full_adder FA3 (.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .cout(cout));
endmodule


//step 3: using 4bit_RCA implement 16bit_ripple_carry_adder

module rca_16bit (
    input  wire [15:0] a,
    input  wire [15:0] b,
    input  wire        cin,
    output wire [15:0] sum,
    output wire        cout
);
    wire c1, c2, c3; 
    rca_4bit RCA0 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
    rca_4bit RCA1 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
    rca_4bit RCA2 (.a(a[11:8]),  .b(b[11:8]),  .cin(c2), .sum(sum[11:8]), .cout(c3));
    rca_4bit RCA3 ( .a(a[15:12]), .b(b[15:12]), .cin(c3),.sum(sum[15:12]), .cout(cout));
endmodule

