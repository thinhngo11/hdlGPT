`timescale 1ns/1ps

module tb_magnitude_comparator_4bit();
    reg [3:0] A;
    reg [3:0] B;
    wire A_greater;
    wire A_equal;
    wire A_less;

    // Instantiate the 4-bit magnitude comparator
    magnitude_comparator_4bit uut (
        .A(A),
        .B(B),
        .A_greater(A_greater),
        .A_equal(A_equal),
        .A_less(A_less)
    );

    // Stimulus generation and checking
    initial begin
        // Test cases
        $display("A\tB\tA_greater\tA_equal\tA_less");
        for (A = 0; A <= 15; A = A + 1) begin
            for (B = 0; B <= 15; B = B + 1) begin
                #10; // Wait for 10 time units
                $display("%b\t%b\t%b\t\t%b\t\t%b", A, B, A_greater, A_equal, A_less);
            end
        end
        $finish;
    end

endmodule
