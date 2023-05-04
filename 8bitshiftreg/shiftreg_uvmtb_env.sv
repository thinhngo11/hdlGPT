class loadable_shift_register_env extends uvm_env;
    `uvm_component_utils(loadable_shift_register_env)

    loadable_shift_register_agent agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = loadable_shift_register_agent::type_id::create("agent", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.virtual_intf = this.get_virtual_interface();
    endfunction
endclass
