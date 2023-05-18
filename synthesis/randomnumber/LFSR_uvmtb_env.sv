class rng_env extends uvm_env;
    `uvm_component_utils(rng_env)

    rng_agent agent;
    rng_scoreboard sb;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = rng_agent::type_id::create("agent", this);
        sb = rng_scoreboard::type_id::create("sb", this);        
    endfunction

    function void connect_phase(uvm_phase phase);
        uvm_config_db#(rng_if)::set(this, "agent", "rng_if", get_interface_handle());
        agent.mon.item_port.connect(sb.item_collector);        
    endfunction

    protected function rng_if get_interface_handle();
        rng_if rng_if;
        if (!uvm_config_db#(rng_if)::get(this, "", "rng_if", rng_if))
            `uvm_fatal("RNG_ENV", "Did not get the rng_if handle")
        return rng_if;
    endfunction
endclass
