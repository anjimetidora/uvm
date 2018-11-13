class base_sequence extends uvm_sequence#(mc_sequence_item);
	  `uvm_object_utils(base_sequence)


	mc_sequence_item seq_item;

	function new(string name="base_sequence");
	  super.new(name);
	endfunction


	//task body();
	//begin
	//  `uvm_info(get_name(),"write sequence",UVM_HIGH)
	//	  `uvm_do_with(req,{req.w_r==1;req.en==1;});
	//	end
	//	endtask
endclass
