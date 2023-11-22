module mux41_df(i0,i1,i2,i3,s1,s0,out);
    input i0,i1,i2,i3,s1,s0;
    output out;
    assign out = (~s1 & ~s0 & i0) | (~s1 & s0 & i1) | (s1 & ~s0 & i2) | (s1 & s0 & i3);
endmodule

module mux_tb_df;
    reg i0,i1,i2,i3,s1,s0;
    wire out;
    integer i;
    mux41_df mux41_df_inst(i0,i1,i2,i3,s1,s0,out);
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