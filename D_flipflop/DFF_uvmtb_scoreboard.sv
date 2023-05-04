// dff_scoreboard.sv
class dff_scoreboard extends uvm_component;
  `uvm_component_utils(dff_scoreboard)

  uvm_analysis_port #(dff_seq_item) exp_port;
  uvm_analysis_port #(dff_seq_item) act_port;

  bit prev_d;

  function new(string name = "dff_scoreboard", uvm_component parent);
    super.new(name, parent);
    exp_port = new("exp_port", this);
    act_port = new("act_port", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    dff_seq_item exp_item, act_item;

    forever begin
      fork
        begin
          exp_port.get_next_item(exp_item);
          exp_port.item_done();
          act_port.get_next_item(act_item);
          act_port.item_done();

          if (prev_d !== act_item.q) begin
            `uvm_error(get_full_name(), $sformatf("Mismatch detected! Expected: %0d, Actual: %0d",
                                                  prev_d, act_item.q))
          end
          prev_d = exp_item.d;
        end
      join_none
    end
  endtask
endclass
