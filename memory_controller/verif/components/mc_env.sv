class mc_env extends uvm_env;
	`uvm_component_utils(mc_env)
//agent handle creation
	mc_agent agnt;
	mc_scoreboard sb;

	//class constructor
	function new(string name="mc_env", uvm_component parent=null);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
	super.build_phase(phase);
		agnt=mc_agent::type_id::create("agnt",this);
		sb=mc_scoreboard::type_id::create("sb",this);
		uvm_config_db #(int)::set(this,"agnt","is_active",UVM_ACTIVE);
	endfunction

	function void connect_phase(uvm_phase phase);
		agnt.mon.mon_analysis_port.connect(sb.sb_port);
	endfunction

endclass
