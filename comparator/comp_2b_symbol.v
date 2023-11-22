module comparator_sym(
    input [1:0] a, b,
    output reg alb, aeb, agb
);
    always @ (*) begin
        agb = 0; alb = 0; aeb = 0;
        if (a>b) agb = 1;
        else if (a<b) alb = 1;
        else aeb = 1;
    end
    
endmodule

module comparator_sym_tb;
    reg [1:0] a, b;
    wire alb, aeb, agb;
    integer i;
    comparator_sym tb(a, b, alb, aeb, agb);
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
