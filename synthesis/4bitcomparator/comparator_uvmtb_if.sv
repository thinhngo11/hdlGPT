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
    
 // Assertion checkers
    a_A_greater: assert property (p_A_greater) else $error("A_greater assertion failed");
    a_A_equal: assert property (p_A_equal) else $error("A_equal assertion failed");
    a_A_less: assert property (p_A_less) else $error("A_less assertion failed");

         // Cover properties
    cover property(@(posedge clk) (A_greater && (A > B))) c_A_greater;
    cover property(@(posedge clk) (A_equal && (A == B))) c_A_equal;
    cover property(@(posedge clk) (A_less && (A < B))) c_A_less;
        
endinterface
