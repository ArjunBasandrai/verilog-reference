module mux41_beh(i0,i1,i2,i3,s1,s0,out);
    input i0,i1,i2,i3,s1,s0;
    output reg out;
    always @ (*)
        begin
            if (s1)
                begin
                    if (s0)
                        out = i3;
                    else
                        out = i2;
                end
            else
                begin
                    if (s0)
                        out = i1;
                    else
                        out = i0;
                end
        end
endmodule

module mux_tb_beh;
    reg i0,i1,i2,i3,s1,s0;
    wire out;
    integer i;
    mux41_beh tb(i0,i1,i2,i3,s1,s0,out);
    initial begin
        for (i=0; i<=15; i=i+1) 
            begin
                {i0,i1,i2,i3} = i;
                {s1, s0} = 2'b00; #1;
                {s1, s0} = 2'b01; #1;
                {s1, s0} = 2'b10; #1;
                {s1, s0} = 2'b11; #1;
            end
    end
endmodule
