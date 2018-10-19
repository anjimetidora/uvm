class read_test extends base_test;
`uvm_component_utils(read_test)

r_sequence r_seq;
mc_env env;
function new(string name="read_test",uvm_component parent);
  super.new(name,parent);
endfunction

function build_phase(uvm_phase phase);
		super.build_phase(phase);
		r_seq=read_sequence::type_id::create("read_sequence",this);
endfunction

task run_phase(uvm_phase phase);
	phase.raise_objection(phase)
	r_seq.start(env.agnt.seqr);
	`uvm_info(get_name"read test is running.....................")
	phase.drop_objection(phase)
endtask

endclass
