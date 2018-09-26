class mc_sequence extends uvm_sequence #(mc_seq_item);
	`uvm_object_utils(mc_sequence)

	`uvm_declare_p_sequencer(mc_sequencer)
	//class constructor 
	function new(string name="mc_sequence");
		super.new(name);
	endfunction

	virtual task pre_body();
	`uvm_info("BASE-SEQ",$sformatf("Optional code can be placed here in pre_body()"),UVM_MEDIUM);
	if(starting_phase !=null)
		starting_phase.raise_objection(this);
	endtask

	virtual task body();
	`uvm_info("base_seqnc",$sformatf("starting body of %s",this.get_name()),UVM_MEDIUM);
	req=mc_seq_item::type_id::create("req");
	repeat(4)
		begin
			start_item(req);
			assert (req.randomize());
			finish_item(req);
		end
			`uvm_info(get_type_name(),$sformatf("sequnc %s is over",this.get_name()),UVM_MEDIUM);
	endtask

	virtual task post_body();
		`uvm_info(get_type_name(),$sformatf("optional code can be placed here in post_body"),UVM_MEDIUM);
	if(starting_phase!=null)
		starting_phase.drop_objection(this);
	endtask

endclass

