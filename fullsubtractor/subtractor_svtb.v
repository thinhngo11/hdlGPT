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

    // Randomize inputs and apply constraints
    class Inputs;
        rand bit [7:0] A;
        rand bit [7:0] B;

        function void post_randomize();
            // You can apply any constraints here if needed
        endfunction
    endclass

    Inputs inputs = new();

    // Test stimulus generation
    task stimulus();
        repeat (100) begin
            inputs.randomize();
            A = inputs.A;
            B = inputs.B;
            #10;
            $display("A = %h, B = %h, Difference = %h, BorrowOut = %b", A, B, Difference, BorrowOut);
        end
        $finish;
    endtask

    // Run test stimulus
    initial begin
        stimulus();
    end
endmodule
