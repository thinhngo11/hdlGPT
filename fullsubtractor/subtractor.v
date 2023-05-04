module full_subtractor_8bit(input [7:0] A, input [7:0] B, output [7:0] Difference, output BorrowOut);
    wire [8:0] SubResults;
    wire [7:0] Borrows;

    genvar i;
    generate
        for (i = 0; i < 8; i++) begin : FullSubtractorStage
            full_subtractor fs(
                .A(A[i]),
                .B(B[i]),
                .BorrowIn(i == 0 ? 1'b0 : Borrows[i-1]),
                .Difference(SubResults[i]),
                .BorrowOut(Borrows[i])
            );
        end
    endgenerate

    assign Difference = SubResults[7:0];
    assign BorrowOut = Borrows[7];

endmodule

module full_subtractor(input A, input B, input BorrowIn, output Difference, output BorrowOut);
    wire A_xor_B;
    wire A_nand_B;
    wire A_nand_B_nand_BorrowIn;

    xor (A_xor_B, A, B);
    nand (A_nand_B, A, B);
    nand (A_nand_B_nand_BorrowIn, A_nand_B, BorrowIn);

    xor (Difference, A_xor_B, BorrowIn);
    nand (BorrowOut, A_nand_B_nand_BorrowIn, A_xor_B);
endmodule
