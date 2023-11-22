module mux41_case (i0,i1,i2,i3,s1,s0,out);
    input i0,i1,i2,i3,s1,s0;
    output reg out;
    always @ (*)
        begin
            case ({s1,s0})
                2'b00: out = i0;
                2'b01: out = i1;
                2'b10: out = i2;
                2'b11: out = i3;
            endcase
        end
endmodule

module mux_tb_case;
    reg i0,i1,i2,i3,s1,s0;
    wire out;
    integer i;
    mux41_case tb(i0,i1,i2,i3,s1,s0,out);
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

