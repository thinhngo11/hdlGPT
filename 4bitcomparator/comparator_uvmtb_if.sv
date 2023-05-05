interface magnitude_comparator_if(input logic clk);
    logic [3:0] A;
    logic [3:0] B;
    logic A_greater;
    logic A_equal;
    logic A_less;

    // Assertion properties
    property p_A_greater;
        @(posedge clk) (A_greater |=> (A > B));
    endproperty

    property p_A_equal;
        @(posedge clk) (A_equal |=> (A == B));
    endproperty

    property p_A_less;
        @(posedge clk) (A_less |=> (A < B));
    endproperty
