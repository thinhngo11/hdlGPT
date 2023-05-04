interface loadable_up_down_counter_if(input wire clk);
    logic reset;
    logic load;
    logic up_down;
    logic [3:0] load_data;
    logic [3:0] count;
endinterface
