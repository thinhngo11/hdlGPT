class loadable_shift_register_agent extends uvm_agent;
    `uvm_component_utils(loadable_shift_register_agent)

    loadable_shift_register_if intf;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        intf = loadable_shift_register_if::type_id::create("intf", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        assert($cast(virtual_intf, get_virtual_interface()));
    endfunction
endclass
