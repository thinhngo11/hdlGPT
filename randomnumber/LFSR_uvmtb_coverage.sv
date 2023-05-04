1. Define a covergroup for RNG output:

```verilog
covergroup rng_cg @(posedge clk);
  option.per_instance = 1;
  option.comment = "RNG Output Coverage";

  // Coverpoint for RNG output values
  rng_cp: coverpoint rng_out {
    bins rng_values[] = {[0:255]};
  }

  // Coverpoint for RNG output transitions
  rng_trans_cp: coverpoint rng_out_prev, rng_out {
    bins trans[][] = ( {[0:255]}, {[0:255]} );
  }
endgroup
