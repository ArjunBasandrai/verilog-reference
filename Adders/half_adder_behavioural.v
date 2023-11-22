module ha_beh(A,B,S,C);
    input A, B;
    output reg S, C;

    wire A, B;

    always @ (A or B)
        begin
        S = A ^ B;
        C = A & B;
        end
endmodule