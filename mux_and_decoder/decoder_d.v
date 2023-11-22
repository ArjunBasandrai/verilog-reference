module decoder_d(en, a, b, y);
    input a, b, en;
    output [3:0] y;
    assign y[0] = {(en) & (~a) & (~b)};
    assign y[1] = {(en) & (~a) & (b)};
    assign y[2] = {(en) & (a) & (~b)};
    assign y[3] = {(en) & (a) & (b)};
endmodule

module decoder_tb;
    reg en, a, b;
    wire [3:0] y;
    integer i;
    decoder_d tb(en, a, b, y);
    initial begin
        for (i=3'b0;i<8;i=i+1)
            begin
                {en, a, b} = i; #10;
            end
        {en, a, b} = 3'b0;
    end
endmodule