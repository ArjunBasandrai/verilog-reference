
module comparator(
    input [1:0] a, b,
    output alb, aeb, agb
);

    assign alb = (~a[0] & ~a[1] & b[0]) | (~a[1] & b[1]) | (b[1] & b[0] & ~a[0]);
    assign agb = (a[0] & a[1] & ~b[0]) | (a[1] & ~b[1]) | (~b[1] & ~b[0] & a[0]);
    assign aeb = (~a[1] & ~a[0] & ~b[1] & ~b[0]) |
                 (~a[1] & a[0] & ~b[1] & b[0]) |
                 (a[1] & ~a[0] & b[1] & ~b[0]) |
                 (a[1] & a[0] & b[1] & b[0]);
endmodule

module comparator_tb;
    reg [1:0] a, b;
    wire alb, aeb, agb;
    integer i;
    comparator tb(a, b, alb, aeb, agb);
    initial begin
        for (i=0; i<4; i=i+1) 
            begin
                a = i;
                b = i+1;
                #20;
            end 
        for (i=0; i<4; i=i+1) 
            begin
                a = i;
                b = i;
                #20;
            end
        for (i=0; i<4; i=i+1) 
            begin
                a = i+1;
                b = i;
                #20;
            end
    end
endmodule