module fa_df(S, C, A, B, CIN);
    input A, B, CIN;
    output S, C;
    assign S = {A ^ B ^ CIN};
    assign C = {{A ^ B} & CIN | {A & B}};
endmodule

module fa_df_tb;
    reg A, B, CIN;
    wire S, C;
    integer i;
    fa_df tb(S, C, A, B, CIN);
    initial
    begin
        for (i=3'b0;i<8;i=i+1)
            begin
                {A, B, CIN} = i; #10;
            end
        {A, B, CIN} = 3'b0;
    end
endmodule
