module mealy(y, i, clk, rst);
    input i, clk, rst;
    output reg y;

    reg [1:0] cs, ns;

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;

    always @ (cs or i) begin
        y=1'b0;
        case (cs)
            s0: if (i) ns = s1; else ns = s0;
            s1: if (i) ns = s1; else ns = s2;
            s2: if (i) ns = s3; else ns = s0;
            s3: if (i) ns = s1; else begin ns = s2; y=1'b1; end
        endcase
    end
    always @ (posedge clk or posedge rst) begin
        if (rst) cs <= s0;
        else cs <= ns;
    end
endmodule

module mealy_tb;
    reg i, clk, rst;
    wire y;
    mealy tb(y,i,clk,rst);
    always #5 clk = ~clk;
    initial begin
        i=1; clk=0; rst=1;
        #10 rst=0;
        #10 i=0;
        #10 i=1;
        #10 i=0;
        #10 i=1;
        #10 i=0;
        #50 $stop;
    end
endmodule
