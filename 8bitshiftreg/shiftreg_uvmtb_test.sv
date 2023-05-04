class loadable_shift_register_test extends uvm_test;
    `uvm_component_utils(loadable_shift_register_test)

    loadable_shift_register_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = loadable_shift_register_env::type_id::create("env", this);
    endfunction

    function void run_phase(uvm_phase phase);
        phase.raise_objection(this, "Starting test");

        fork
            automatic loadable_shift_register_if intf = env.agent.intf;
            begin
                // Stimulus generation
                repeat (20) begin
                    #10 intf.reset = 1;
                    #10 intf.reset = 0;

                    // Load data
                    intf.load = $urandom_range(0, 1);
                    intf.data_in = $urandom();
                    intf.shift_in = $urandom_range(0, 1);
                    #10 intf.load = 0;

                    // Shift right
                    repeat (8) begin
                        #10;
                    end
                end

                phase.drop_objection(this, "Test completed");
            end
        join
    endfunction
endclass
