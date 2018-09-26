class mc_test extends uvm_test;
	`uvm_component_utils(mc_test);
	mc_env test_env;
	mc_cfg cfg;


	function new(string name="mc_test", uvm_component parent=null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		$display("test_case printing");
		test_env=mc_env::type_id::create("mc_env",this);
		cfg=mc_cfg::type_id::create("mc_cfg",this);

		uvm_config_db #(mc_cfg) ::set(this,"test_env.agnt","mc_cfg",this.cfg);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	/*function void start_of_simulation_phase(uvm_phase phase);
		uvm_config_db #(uvm_object_wrapper)::set(this,"test_env.agnt.sequr.main_phase","default_sequence",mc_sequence::type_id::get());
	endfunction*/

	task run_phase(uvm_phase phase);
	mc_sequence test_seqc=mc_sequence::type_id::create("test_seqc",this);
	mc_write_seq write_seq=mc_write_seq::type_id::create("write_seq",this);
	mc_read_seq rd_seq=mc_read_seq::type_id::create("rd_seq",this);

	phase.raise_objection(this);
	$display("before starting sequence in test");
	//test_seqc.start(test_env.agnt.seqr);
	write_seq.start(test_env.agnt.seqr);
	rd_seq.start(test_env.agnt.seqr);
	$display("after starting sequence in test");
	phase.drop_objection(this);
	endtask
endclass

