module dff (d, clk, rst, q, qbar);
    input d, clk, rst;
    output reg q, qbar;
    always @ (posedge clk or posedge rst) begin
        if (rst) begin q <= 1'b0; qbar <= 1'b1; end
        else begin q <= d; qbar <= ~d; end
    end
endmodule

module dff_tb;
    reg d, clk, rst;
    wire q, qbar;
    dff tb(d, clk, rst, q, qbar);
    always #5 clk = ~clk;
    initial begin
        rst = 1; clk = 0; d = 1;
        #10 rst = 0;
        #10 d = 0;
        #10 d = 1;
        #50 $stop;
    end
endmodule