class mc_write_seq extends mc_sequence;//#(mc_seq_item);
	`uvm_object_utils(mc_write_seq)

	function new(string name="mc_write_seq");
		super.new(name);
	endfunction

	virtual task body();
	`uvm_do_with(req,{req.wr_en==1;
										req.addr=='d15;});
endtask
endclass

