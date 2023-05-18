`timescale 1ns / 1ps

module tb_decoder_4to16();
    reg [3:0] sel;
    wire [15:0] out;

    // Instantiate the decoder module
    decoder_4to16 decoder(
        .sel(sel),
        .out(out)
    );

    // Testbench stimulus
    initial begin
        $monitor("At time %t, sel = %b, out = %b", $time, sel, out);

        // Test all possible input values
        for (integer i = 0; i < 16; i++) begin
            sel = i;
            #10; // Wait 10 time units before changing the input
        end

        // Finish the simulation
        $finish;
    end
endmodule
