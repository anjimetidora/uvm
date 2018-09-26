class mc_agent extends uvm_agent;
`uvm_component_utils(mc_agent)
// creating handles for components
	mc_sequencer seqr;
	mc_driver drv;
	mc_monitor mon;

//class constructor 
	function new(string name="mc_agent", uvm_component parent);
		super.new(name,parent);
	endfunction

//component creations
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(get_is_active())
	begin
		seqr=mc_sequencer::type_id::create("seqr",this);
		drv=mc_driver::type_id::create("drv",this);
	end
	mon=mc_monitor::type_id::create("mon",this);
endfunction

function void connect_phase(uvm_phase phase);
	if(get_is_active())
	begin
		drv.seq_item_port.connect(seqr.seq_item_export);
	end
endfunction
endclass
