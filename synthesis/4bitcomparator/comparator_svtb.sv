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

    // Stimulus generation class
    class Stimulus;
        rand bit [3:0] A, B;

        // Constraint for random values
        constraint c_A_B {
            A dist { [0:15] :/ 1 };
            B dist { [0:15] :/ 1 };
        }
    endclass

    // Testbench process
    task run_test();
        Stimulus stim;
        integer i;

        // Create a new instance of the stimulus class
        stim = new();

        // Display header
        $display("A\tB\tA_greater\tA_equal\tA_less");

        // Run random tests
        for (i = 0; i < 50; i++) begin
            // Generate random values for A and B
            stim.randomize();

            // Assign random values to A and B
            A = stim.A;
            B = stim.B;

            // Wait for 10 time units
            #10;

            // Display results
            $display("%b\t%b\t%b\t\t%b\t\t%b", A, B, A_greater, A_equal, A_less);
        end

        // Finish simulation
        $finish;
    endtask

    // Run the testbench
    initial begin
        run_test();
    end

endmodule
