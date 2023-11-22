module johnson(q, clk ,rst);
    output reg [3:0] q;
    input clk, rst;
    always @ (posedge clk or posedge rst) begin
        if (rst) begin 
            q <= 4'b0000; 
        end
        else begin
            q <= {~q[0], q[3:1]};
        end
    end
endmodule

module johnson_tb;
    reg clk, rst;
    wire [3:0] q;
    johnson tb(q, clk, rst);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst = 1;
        #10 rst = 0;
        #200 $stop;
    end
endmodule