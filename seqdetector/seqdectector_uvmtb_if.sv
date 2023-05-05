// Define interface
interface sequence_detector_if(input logic clk);
  logic reset;
  logic data_in;
  logic detection;

  sequence_detector_1011 sequence_detector_inst(
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .detection(detection)
  );
endinterface
