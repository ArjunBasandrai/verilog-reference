module dff(q, d, rst_n, clk, init_value);
    output reg q;
    input d, rst_n, clk, init_value;
    always @ (negedge clk or posedge rst_n) begin
        if (~rst_n) q <= init_value;
        else q<=d;
    end
endmodule

module random_counter(
    input clk,rst_n,
    input [0:2] initialized_value,
    output [0:2] counter_random
);  
    wire [0:2] q;
    wire [0:2] d;
    assign d[0] = (~q[0] | q[2]);
    assign d[1] = (~q[1]);
    assign d[2] = (~q[0] | (q[2] & ~q[1]));
    dff dff0(q[0], d[0], rst_n, clk, initialized_value[0]);
    dff dff1(q[1], d[1], rst_n, clk, initialized_value[1]);
    dff dff2(q[2], d[2], rst_n, clk, initialized_value[2]);
    assign counter_random = q;
endmodule

module random_tb;
    reg clk,rst_n;
    reg [0:2] initialized_value;
    wire [0:2] counter_random;
    random_counter tb(clk,rst_n,initialized_value,counter_random);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst_n = 0;
        initialized_value = 3'b100;
        #20 rst_n = 1;
    end
endmodule