class mc_read_seq extends mc_sequence;//#(mc_seq_item);
	`uvm_object_utils(mc_read_seq)

	function new(string name= "mc_read_seq");
		super.new(name);
	endfunction

	virtual task body();
	`uvm_do_with(req,{req.rd_en==1;
										req.addr=='d15;});
endtask 
endclass
