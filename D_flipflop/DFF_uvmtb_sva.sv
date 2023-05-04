// 1. Check the correct output on the positive edge of the clock:

property p_correct_output_on_posedge(input_d, clk, output_q);
  @(posedge clk) disable iff (reset) (input_d |-> ##1 output_q === input_d);
endproperty

assert property (p_correct_output_on_posedge(d, clk, q)) else
  `uvm_error("SVA", "Output Q is not equal to the input D on the positive edge of the clock.");


// 2. Check the stable output during the negedge of the clock:
property p_stable_output_on_negedge(output_q, clk);
  @(negedge clk) disable iff (reset) (output_q === $past(output_q));
endproperty

assert property (p_stable_output_on_negedge(q, clk)) else
  `uvm_error("SVA", "Output Q is not stable during the negedge of the clock.");
