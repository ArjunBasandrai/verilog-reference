module srff (r, s, clk, rst, q, qbar);
    input r, s, clk, rst;
    output reg q, qbar;

    always @ (posedge clk or posedge rst)
        begin
            if (rst) begin
                q <= 1'b0;
                qbar <= 1'b1;
            end
            else begin 
                case ({r, s})
                    2'b00: begin q<=q; qbar<=qbar; end
                    2'b01: begin q<=1'b1; qbar<=1'b0; end
                    2'b10: begin q<=1'b0; qbar<=1'b1; end
                    2'b11: begin q<=1'b1; qbar<=1'b1; end
                endcase
            end
        end
endmodule

module srff_tb;
    reg r, s, clk, rst;
    wire q, qbar;
    integer i;
    srff tb(r, s, clk, rst, q, qbar);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst = 1; r = 0; s = 0; #10;
        rst = 0; #10;
        r=0; s=1; #10;
        r=1; s=0; #10;
        r=1; s=1; #50;
        $stop;
    end
endmodule