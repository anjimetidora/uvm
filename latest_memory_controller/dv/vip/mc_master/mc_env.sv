class mc_env extends uvm_env;
  `uvm_component_utils(mc_env)

  mc_agent agnt;

  function new(string name="mc_env",uvm_component parent);
	super.new(name,parent);
  endfunction 

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  `uvm_info(get_name(),"build the agent in env...........................",UVM_HIGH)
   agnt=mc_agent::type_id::create("agnt",this);
   uvm_config_db#(uvm_active_passive_enum)::set(.cntxt(this),
																								.inst_name("*"),
																								.field_name("is_active"),
																								.value(UVM_ACTIVE));
endfunction

endclass
