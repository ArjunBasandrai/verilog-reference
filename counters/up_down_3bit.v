module updown(q, up_down, clk, rst);
    input up_down, clk, rst;
    output reg [3:0] q;

    always @ (posedge clk or posedge rst) begin
        if (rst) begin q<=4'b0000; end
        else begin
            if (up_down) begin
                q <= q + 1;
            end
            else begin
                q <= q - 1;
            end
        end
    end
endmodule

module up_down_3bit_tb;
    reg up_down, clk, rst;
    wire [3:0] q;
    updown tb(q, up_down, clk, rst);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst = 1; up_down = 1;
        #10 rst = 0;
        #180 up_down = 0;
        #200 $stop;
    end
endmodule