module fa_beh(S, C, A, B, CIN);
    input A, B, CIN;
    output reg S, C;
    always @ (A or B or CIN)
        begin
            {S, C} = {A + B + CIN};
        end
endmodule

module fa_beh_tb;
    reg A, B, CIN;
    wire S, C;
    integer i;
    fa_beh tb(S, C, A, B, CIN);
    initial
    begin
        for (i=3'b0;i<8;i=i+1)
            begin
                {A, B, CIN} = i; #10;
            end
        {A, B, CIN} = 3'b0;
    end
endmodule

