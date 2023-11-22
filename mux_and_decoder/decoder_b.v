module decoder_beh(en, a, b, y);
    input a, b, en;
    output reg [3:0] y;
    always @ (en or a or b)
        begin
            if (en)
                begin
                    case ({a, b})
                        2'b00: y = 4'b0001;
                        2'b01: y = 4'b0010;
                        2'b10: y = 4'b0100;
                        2'b11: y = 4'b1000;
                    endcase
                end
            else
                y = 4'b0000;
        end
endmodule

module decoder_beh_tb;
    reg en, a, b;
    wire [3:0] y;
    integer i;
    decoder_beh tb(en, a, b, y);
    initial begin
        for (i=3'b0;i<8;i=i+1)
            begin
                {en, a, b} = i; #10;
            end
        {en, a, b} = 3'b0;
    end
endmodule
