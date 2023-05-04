module tb_full_subtractor_8bit();
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] Difference;
    wire BorrowOut;

    // Instantiate the full_subtractor_8bit module
    full_subtractor_8bit fs8(
        .A(A),
        .B(B),
        .Difference(Difference),
        .BorrowOut(BorrowOut)
    );

    // Clock generation for the testbench
    always begin
        #10; // wait for 10 time units between each test
        $display("A = %h, B = %h, Difference = %h, BorrowOut = %b", A, B, Difference, BorrowOut);
    end

    // Test cases
    initial begin
        A = 8'b0101_0101;
        B = 8'b0011_0011;
        #100;

        A = 8'b1111_0000;
        B = 8'b0000_1111;
        #100;

        A = 8'b1001_1001;
        B = 8'b0110_0110;
        #100;

        A = 8'b0000_0000;
        B = 8'b0000_0000;
        #100;

        A = 8'b1111_1111;
        B = 8'b0000_0001;
        #100;

        $finish; // End the simulation after all test cases
    end
endmodule
