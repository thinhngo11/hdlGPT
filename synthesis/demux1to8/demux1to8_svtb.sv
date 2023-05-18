`timescale 1ns / 1ps

module tb_demux_1to8;
    logic sel;
    logic data_in;
    logic [7:0] data_out;

    // Instantiate the demux_1to8 module
    demux_1to8 demux (
        .sel(sel),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clocking block for stimulus generation
    always begin
        #5 sel <= $random() % 8;
        #5 data_in <= $random() % 2;
    end

    // Stimulus process
    initial begin
        // Variables for displaying the results
        integer i;

        // Initial conditions
        data_in = 1'b0;
        sel = 3'b000;

        // Apply test vectors
        for (i = 0; i < 16; i = i + 1) begin
            // Wait for the next clock edge
            @(posedge sel or posedge data_in);

            // Display the output on the console
            $display("sel: %b, data_in: %b, data_out: %b", sel, data_in, data_out);
        end

        // Finish the simulation
        $finish;
    end

endmodule
