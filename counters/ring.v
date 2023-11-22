module ring(q, clk, rst);
    output reg[3:0] q;
    input clk, rst;

    always @ (posedge clk or posedge rst)
    begin
        if (rst) q <= 4'b1000;
        else q <= {q[0], q[3:1]};
    end
endmodule

module ring_tb;
    wire [3:0] q;
    reg clk, rst;
    ring tb(q, clk, rst);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst = 1; #10;
        rst = 0; #200;
        $stop;
    end
endmodule