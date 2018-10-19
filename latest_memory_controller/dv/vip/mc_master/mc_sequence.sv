class base_sequence extends uvm_sequence#(mc_sequence_item);
	  `uvm_object_utils(mc_sequence)

	function new(string name="mc_sequence");
	  super.new(name);
	endfunction


	task body();
	  `uvm_info("write sequence");
		  `uvm_do_with(req,{req.w_r=='b1,req.en=='b1});
	endtask
endclass




class r_sequence extends base_sequence#(mc_sequence_item);

`uvm_object_utils(r_sequence)

function new(string name="r_sequence");
	super.new(name);
endfunction

task body();
  `uvm_info(get_name,"read_sequence is running.................")
	uvm_do_with(req,{req.w_r=='b0,req.en=='b1});
  endtask
endclass
