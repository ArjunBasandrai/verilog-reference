module mod10(q, clk ,rst);
    output reg [3:0] q;
    input clk, rst;
    always @ (posedge clk or posedge rst) begin
        if (rst) begin 
            q <= 4'b0000; 
        end
        else begin
            if (q >= 9) q <= 4'b0000;
            else q <= q + 1;
        end
    end
endmodule

module mod10_tb;
    reg clk, rst;
    wire [3:0] q;
    mod10 tb(q, clk, rst);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst = 1;
        #10 rst = 0;
        #200 $stop;
    end
endmodule