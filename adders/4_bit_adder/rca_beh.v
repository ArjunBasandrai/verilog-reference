module full_adder(
    input a, input b, input cin, output reg s, output reg cout
);
    always @ (a, b, cin)
    begin
        s = a ^ b ^ cin;
        cout = (a & b) | ((a ^ b) & cin);
    end
endmodule


module rca_beh(
    input [3:0] a, input [3:0] b, input cin, output [3:0] s, output cout
);
    wire c1, c2, c3;
    full_adder fa0(a[0], b[0], cin, s[0], c1);
    full_adder fa1(a[1], b[1], c1, s[1], c2);
    full_adder fa2(a[2], b[2], c2, s[2], c3);
    full_adder fa3(a[3], b[3], c3, s[3], cout);
endmodule

module rca_beh_tb;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] s;
    wire cout;
    rca tb (a, b, cin, s, cout);
    initial begin
        cin = 0;
        a = 4'b0110; b = 4'b1100; #10;
        a = 4'b1110; b = 4'b1000; #10;
        a = 4'b0111; b = 4'b1110; #10;
        a = 4'b0010; b = 4'b1001; #10;
        $stop;
    end
endmodule