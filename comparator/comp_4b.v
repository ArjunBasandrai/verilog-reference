module comparator_4bit(
    input [3:0] a, b,
    output reg alb, aeb, agb
);
    always @ (*) begin
        agb = 0; alb = 0; aeb = 0;
        if (a>b) agb = 1;
        else if (a<b) alb = 1;
        else aeb = 1;
    end
endmodule

module comparator_4bit_tb;
    reg [3:0] a, b;
    wire alb, aeb, agb;
    integer i;
    comparator_4bit tb(a, b, alb, aeb, agb);
    initial begin
        a=12; b=10; #10;
        b=15; #10;
        b=12; #10;
    end
endmodule
