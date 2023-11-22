module siso (so, si, clk, rst);
    output reg so;
    input si, clk, rst;
    reg [3:0]q;
    always @ (posedge clk or posedge rst) begin
        if (rst) begin q <= 4'b0000; so <= 0; end
        else begin
            q <= q>>1;
            q[3] <= si;
            so = q[0];
        end    
    end   
endmodule

module siso_tb;
    wire so;
    reg si, clk, rst;
    siso tb(so, si, clk, rst);
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
