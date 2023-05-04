module encoder_8to3_assertions(
    input logic [7:0] data,
    input logic [2:0] encoded_data,
    input logic clk
);

    // Assert only one bit is high at a time in the input data
    property p_one_hot_input;
        @(posedge clk) (|$data) && ($onehot(data));
    endproperty
    a_one_hot_input: assert property(p_one_hot_input) else
        `uvm_error("ASSR_ERROR", "Invalid input: more than one bit high at a time or all bits low");

    // Assert the encoded_data is correct for the given input data
    property p_correct_encoding;
        @(posedge clk) (encoded_data == $clog2(data));
    endproperty
    a_correct_encoding: assert property(p_correct_encoding) else
        `uvm_error("ASSR_ERROR", "Incorrect encoding");

    // Cover properties
    cover property(p_one_hot_input)
        `uvm_info("ASSR_INFO", "Valid one-hot input", UVM_MEDIUM);

    cover property(p_correct_encoding)
        `uvm_info("ASSR_INFO", "Correct encoding", UVM_MEDIUM);

endmodule
