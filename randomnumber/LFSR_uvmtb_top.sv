module tb_top;
    logic clk;
    rng_if rng_if_inst(clk);

    lfsr8bit_rng dut (
        .clk(clk),
        .rst(rng_if_inst.rst),
        .random_number(rng_if_inst.random_number)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        uvm_config_db#(uvm_sequencer#(rng_seq_item))::set(null, "uvm_test_top.env.agent.seqr", "default_sequence", rng_seq::type_id::get());
        run_test("rng_test");
    end
endmodule
