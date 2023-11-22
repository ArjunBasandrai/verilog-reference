module cla (
    input [3:0] a, input [3:0] b, input cin, output [3:0] s, output cout
);
    wire [3:0] g, p, c;
    assign g = a & b;
    assign p = a ^ b;
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign cout = g[3] | (p[3] & c[3]);
    assign s = p ^ c;
endmodule;

module cla_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] s;
    wire cout;
    cla tb (a, b, cin, s, cout);
    initial begin
        cin = 0;
        a = 6; b = 10; #100;
        a = 14; b = 8; #100;
        a = 15; b = 9; #100;
        a = 2; b = 11; #100;
        $stop;
    end
endmodule