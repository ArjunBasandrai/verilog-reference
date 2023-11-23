module moore(y,i,clk,rst);
    input i, clk, rst;
    output reg y;

    reg [2:0] cs, ns;

    parameter s0 = 3'b000;
    parameter s1 = 3'b001; 
    parameter s2 = 3'b010; 
    parameter s3 = 3'b011; 
    parameter s4 = 3'b100;

    always @ (cs or i) begin
        case (cs)
            s0: if (i) ns = s1; else ns = s0;
            s1: if (i) ns = s1; else ns = s2;
            s2: if (i) ns = s3; else ns = s0;
            s3: if (i) ns = s1; else ns = s4;
            s4: if (i) ns = s1; else ns = s0;
        endcase
    end
    always @ (posedge clk or posedge rst) begin
        if (rst) cs <= s0;
        else cs <= ns;
    end
    always @ (cs) begin
        if (cs == s4) y=1'b1;
        else y=1'b0;
    end
endmodule

module moore_tb;
    reg i, clk, rst;
    wire y;
    moore tb(y,i,clk,rst);
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