module sipo(q, si, clk, rst);
    output reg [3:0]q;
    input si, clk, rst;

    always @ (posedge clk or posedge rst) begin
        if (rst) q <= 4'b0000;
        else begin
            q <= {si, q[3:1]};
        end    
    end
endmodule

module sipo_tb;
    wire [3:0]q;
    reg si, clk, rst;
    sipo tb(q, si, clk, rst);
    always #5 clk = ~clk;
    initial begin
        rst = 1; clk = 0; si = 0;
        #10 rst = 0;
        #10 si = 1;
        #10 si = 0;
        #10 si = 0;
        #10 si = 1;
        #10 si = 1;
        #50 $stop;
    end
endmodule