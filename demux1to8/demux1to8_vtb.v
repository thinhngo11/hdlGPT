`timescale 1ns / 1ps

module tb_demux_1to8;
    reg sel;
    reg data_in;
    wire [7:0] data_out;

    // Instantiate the demux_1to8 module
    demux_1to8 demux (
        .sel(sel),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Stimulus process
    initial begin
        // Variables for displaying the results
        integer i;

        // Initial conditions
        data_in = 1'b0;
        sel = 3'b000;

        // Apply test vectors
        for (i = 0; i < 8; i = i + 1) begin
            sel = i[2:0];
            data_in = 1'b1;

            // Apply the stimulus and wait for 10ns
            #10;

            // Display the output on the console
            $display("sel: %b, data_in: %b, data_out: %b", sel, data_in, data_out);

            data_in = 1'b0;

            // Apply the stimulus and wait for 10ns
            #10;

            // Display the output on the console
            $display("sel: %b, data_in: %b, data_out: %b", sel, data_in, data_out);
        end

        // Finish the simulation
        $finish;
    end

endmodule
