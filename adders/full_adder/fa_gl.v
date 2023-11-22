module fa_gl(S, C, A, B, CIN);
    input A, B, CIN;
    output S, C;

    wire w1, w2, w3;

    xor x1(w1, A, B);
    xor x2(S, w1, CIN);
    and a1(w2, w1, B);
    and a2(w3, A, B);
    or o1(C, w2, w3);
endmodule

module fa_gl_tb;
    reg A, B, CIN;
    wire S, C;
    integer i;
    fa_gl tb(S, C, A, B, CIN);
    initial
    begin
        for (i=3'b0;i<8;i=i+1)
            begin
                {A, B, CIN} = i; #10;
            end
        {A, B, CIN} = 3'b0;
    end
endmodule